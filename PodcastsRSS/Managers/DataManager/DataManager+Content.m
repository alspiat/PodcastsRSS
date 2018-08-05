//
//  DataManager+Content.m
//  PodcastsRSS
//
//  Created by Алексей on 06.08.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DataManager+Content.h"

#import "Item.h"
#import "FileManager.h"
#import "UIImage+Compression.h"
#import "Downloader.h"
#import "ThreadUtils.h"

@implementation DataManager (Content)

+ (void)getPreviewImage:(Item *)item completionHandler:(BlockWithImage)completionHandler {
    
    NSString *imageName = [FileManager.sharedManager getFilenameFromStringURL:item.imageContent.webLink];
    NSString *filepath = [FileManager.sharedManager getFullPathFolder:FileManager.previewsFolder filename:imageName];
    
    if (item.imageContent.previewLocalLink) {
        UIImage *image = [UIImage imageWithContentsOfFile:filepath];
        completionHandler(image);
    } else if ([FileManager.sharedManager fileExistsAtFolder:FileManager.previewsFolder forName:imageName]) {
        UIImage *image = [UIImage imageWithContentsOfFile:filepath];
        item.imageContent.previewLocalLink = imageName;
        completionHandler(image);
    } else {
        
        NSString *urlString = nil;
        switch (item.sourceType) {
            case ItemTypeTedtalks:
                urlString = [item.imageContent.webLink stringByAppendingString:@"w=300"];
                break;
            case ItemTypeSimplecast:
                urlString = item.imageContent.webLink;
                break;
        }
        
        [Downloader downloadDataWithURL:urlString withCompletionHandler:^(NSData *data) {
            if (item.sourceType == ItemTypeSimplecast) {
                UIImage *image = [UIImage imageWithData:data];
                data = [image dataCompressedWithFactor:0.1];
            }
            [FileManager.sharedManager createFile:imageName withData:data atFolder:FileManager.previewsFolder];
            UIImage *image = [UIImage imageWithData:data];
            item.imageContent.previewLocalLink = imageName;
            
            [ThreadUtils performOnMain:^{
                completionHandler(image);
            }];
        }];
    }
}

+ (void)getImage:(Item*)item completionHandler:(BlockWithImage)completionHandler {
    
    NSString *imageName = [FileManager.sharedManager getFilenameFromStringURL:item.imageContent.webLink];
    NSString *filepath = [FileManager.sharedManager getFullPathFolder:FileManager.imagesFolder filename:imageName];
    
    if (item.imageContent.localLink) {
        UIImage *image = [UIImage imageWithContentsOfFile:filepath];
        completionHandler(image);
    } else if ([FileManager.sharedManager fileExistsAtFolder:FileManager.imagesFolder forName:imageName]) {
        UIImage *image = [UIImage imageWithContentsOfFile:filepath];
        item.imageContent.localLink = imageName;
        completionHandler(image);
    } else {
        
        NSString *urlString = item.imageContent.webLink;
        
        [Downloader downloadDataWithURL:urlString withCompletionHandler:^(NSData *data) {
            [FileManager.sharedManager createFile:imageName withData:data atFolder:FileManager.imagesFolder];
            UIImage *image = [UIImage imageWithData:data];
            item.imageContent.localLink = imageName;
            
            [ThreadUtils performOnMain:^{
                completionHandler(image);
            }];
        }];
    }
}

+ (void)getMediaURL:(Item*)item completionHandler:(BlockWithURL)completionHandler {
    
    NSString *mediaFilename = item.mediaContent.localLink ? item.mediaContent.localLink : [FileManager.sharedManager getFilenameFromStringURL:item.mediaContent.webLink];
    NSString *filepath = [FileManager.sharedManager getFullPathFolder:FileManager.contentFolder filename:mediaFilename];
    
    if (item.mediaContent.localLink) {
        NSURL *url = [NSURL fileURLWithPath:filepath];
        completionHandler(url);
    } else if ([FileManager.sharedManager fileExistsAtFolder:FileManager.contentFolder forName:mediaFilename]) {
        item.mediaContent.localLink = mediaFilename;
        NSURL *url = [NSURL fileURLWithPath:filepath];
        completionHandler(url);
    } else {
        NSURL *url = [NSURL URLWithString:item.mediaContent.webLink];
        completionHandler(url);
    }
    
}

@end
