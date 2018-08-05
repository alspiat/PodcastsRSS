//
//  CoreDataService.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/30/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface CoreDataService : NSObject

- (NSArray<Item *> *)getAllItems;
- (Item *)getItemWithGUID:(NSString *)guid;

- (void)addItem:(Item *)item;
- (void)deleteItem:(Item *)item;

- (BOOL)itemExistsWithGUID:(NSString *)guid;

@end
