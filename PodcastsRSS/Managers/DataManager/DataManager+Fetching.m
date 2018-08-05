//
//  DataManager+Fetching.m
//  PodcastsRSS
//
//  Created by Алексей on 06.08.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DataManager+Fetching.h"
#import "Item.h"
#import "CoreDataService.h"

@implementation DataManager (Fetching)

+ (void)fetchDataWithCompletionHandler:(BlockWithItemsArray)completionHandler {
    CoreDataService *coreDataService = [[CoreDataService alloc] init];
    RssService *rssService = [[RssService alloc] init];
    
    NSArray<Item *> *coreDataItems = [coreDataService getAllItems];
    NSMutableDictionary *coreDataItemsForGUID = [[NSMutableDictionary alloc] initWithCapacity:coreDataItems.count];
    
    NSDictionary *rssChannels = @{[NSNumber numberWithInteger:ItemTypeTedtalks] : [NSURL URLWithString: @"https://feeds.feedburner.com/tedtalks_video"],
                                  [NSNumber numberWithInteger:ItemTypeSimplecast] : [NSURL URLWithString: @"https://rss.simplecast.com/podcasts/4669/rss"]};
    
    for (Item *item in coreDataItems) {
        [coreDataItemsForGUID setObject:item forKey:item.guid];
    }
    
    for (NSNumber* numberType in rssChannels) {
        [rssService fetchItemsByURL:rssChannels[numberType] type:numberType.integerValue withCompletionHandler:^(NSArray<Item *> *items) {
            NSMutableArray *mutableItems = [items mutableCopy];
            [mutableItems enumerateObjectsUsingBlock:^(Item *item, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([coreDataItemsForGUID.allKeys containsObject:item.guid]) {
                    mutableItems[idx] = coreDataItemsForGUID[item.guid];
                }
            }];
            
            completionHandler(mutableItems);
        }];
    }
}

+ (void)fetchOfflineDataWithCompletionHandler:(BlockWithItemsArray)completionHandler {
    CoreDataService *coreDataService = [[CoreDataService alloc] init];
    
    NSArray<Item *> *coreDataItems = [coreDataService getAllItems];
    completionHandler(coreDataItems);
}

@end
