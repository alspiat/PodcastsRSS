//
//  DataManager.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DataManager.h"
#import "Item.h"
#import "FileManager.h"
#import "UIImage+Compression.h"

@implementation DataManager

+ (void) getItemImage:(Item*)item completionHandler: (void(^)(UIImage *image)) completionHandler {

    if (item.imageContent.localLink) {
        UIImage *image = [UIImage imageWithContentsOfFile:item.imageContent.localLink];
        completionHandler(image);
    } else {
        
        NSURL *url = nil;
        switch (item.sourceType) {
            case ItemTypeTedtalks:
                url = [NSURL URLWithString:[NSString stringWithFormat:@"%@w=200", item.imageContent.webLink]];
                break;
            case ItemTypeSimplecast:
                url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", item.imageContent.webLink]];
                break;
        }
        
        NSString *filePath = [FileManager.sharedManager.previewsDirPath stringByAppendingPathComponent:url.lastPathComponent];
        
        if ([NSFileManager.defaultManager fileExistsAtPath:filePath]) {
            item.imageContent.localLink = filePath;
            UIImage *image = [UIImage imageWithContentsOfFile:item.imageContent.localLink];
            completionHandler(image);
        } else {
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                NSData *data = [NSData dataWithContentsOfURL:url];
                UIImage *image = [UIImage imageWithData:data];
                
                if (item.sourceType == ItemTypeSimplecast) {
                    image = [UIImage imageWithImage:image scaledToFillSize:CGSizeMake(50, 50)];
                    data = UIImageJPEGRepresentation(image, 0.2);
                }
                
                [NSFileManager.defaultManager createFileAtPath:filePath contents:data attributes:nil];
                
                item.imageContent.localLink = filePath;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *image = [UIImage imageWithContentsOfFile:item.imageContent.localLink];
                    completionHandler(image);
                });
            });
        }
    }

}

@end
