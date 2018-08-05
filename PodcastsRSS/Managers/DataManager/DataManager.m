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
#import "Downloader.h"
#import "ThreadUtils.h"

#import "CoreDataService.h"

@interface DataManager()

@end

@implementation DataManager

+ (void)saveItemForOffline:(Item *)item progressView:(UIProgressView *)progressView withCompletionHandler:(void(^)(void))completionHandler {
    CoreDataService *coreDataService = [[CoreDataService alloc] init];
    Downloader *downloader = [[Downloader alloc] init];
    
    [downloader downloadFileWithURL:item.mediaContent.webLink withCompletionHandler:^(NSString *path) {
        
        [ThreadUtils performOnMain:^{
            item.mediaContent.localLink = path;
            item.isSaved = YES;
            [coreDataService addItem:item];
        }];
        
        completionHandler();
    }];
    
    [progressView setObservedProgress:downloader.progress];
}

+ (void)removeItemFromOffline:(Item *)item {
    CoreDataService *coreDataService = [[CoreDataService alloc] init];
    [coreDataService deleteItem:item];
    
    [FileManager.sharedManager deleteFile:item.mediaContent.localLink atFolder:FileManager.contentFolder];
    item.isSaved = NO;
}

@end
