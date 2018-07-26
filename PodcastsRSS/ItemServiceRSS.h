//
//  ItemServiceAPI.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemServiceRSS : NSObject

- (void)fetchTedtalksItemsWithCompletionHandler: (void(^)(NSArray<Item*>* items))completionHandler;
- (void)fetchSimplecastItemsWithCompletionHandler: (void(^)(NSArray<Item*>* items))completionHandler;

@end
