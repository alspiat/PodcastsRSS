//
//  Item.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "Item.h"
#import "ItemXMLTagsConstants.h"
#import "NSDate+FormatString.h"

@implementation Item

- (Item *)initWithDictionary:(NSDictionary *)itemDict sourceType:(ItemType)type {
    Item *item = [[Item alloc] init];
    
    item.guid = itemDict[guidField][valueField];
    item.title = itemDict[titleField];
    item.author = itemDict[authorField];
    item.details = itemDict[detailsField];
    item.duration = itemDict[durationField];
    item.pubDate = [NSDate dateFromString: itemDict[pubDateField]];
    item.sourceType = type;
    item.isSaved = NO;
    
    item.imageContent = [[ImageContent alloc] initWithWebLink: itemDict[imageField][imageURLField]];
    item.mediaContent = [[Content alloc] initWithWebLink: itemDict[mediaField][mediaURLField]];
    
    return item;
}

- (Item *)initWithManagedObject:(ItemMO *)itemMO {
    Item *item = [[Item alloc] init];
    
    item.guid = itemMO.guid;
    item.title = itemMO.title;
    item.details = itemMO.details;
    item.author = itemMO.author;
    item.duration = itemMO.duration;
    item.sourceType = itemMO.sourceType;
    item.pubDate = itemMO.pubDate;
    item.isSaved = YES;

    item.imageContent = [[ImageContent alloc] initWithManagedObject:itemMO.imageContent];
    item.mediaContent = [[Content alloc] initWithManagedObject:itemMO.mediaContent];
    
    return item;
}

@end
