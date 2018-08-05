//
//  ItemServiceAPI.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

typedef void (^BlockWithItemsArray)(NSArray<Item *> *);

@interface RssService : NSObject

- (void)fetchItemsByURL:(NSURL *)url type:(ItemType)type withCompletionHandler:(BlockWithItemsArray)completionHandler;

@end
