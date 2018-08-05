//
//  ItemMO+CoreDataClass.m
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ItemMO.h"
#import "Item.h"

NSString * const ItemMOEntityName = @"ItemMO";

@implementation ItemMO

+ (NSFetchRequest<ItemMO *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:ItemMOEntityName];
}

@dynamic author;
@dynamic details;
@dynamic duration;
@dynamic guid;
@dynamic pubDate;
@dynamic sourceType;
@dynamic title;
@dynamic imageContent;
@dynamic mediaContent;

- (ItemMO *)initWithItem:(Item *)item context:(NSManagedObjectContext *)context {
    ItemMO *itemMO = [NSEntityDescription insertNewObjectForEntityForName:ItemMOEntityName inManagedObjectContext:context];
    
    itemMO.guid = item.guid;
    itemMO.title = item.title;
    itemMO.details = item.details;
    itemMO.author = item.author;
    itemMO.duration = item.duration;
    itemMO.sourceType = item.sourceType;
    itemMO.pubDate = item.pubDate;
    
    itemMO.mediaContent = [[ContentMO alloc] initWithContent:item.mediaContent context:context];
    itemMO.imageContent = [[ImageContentMO alloc] initWithContent:item.imageContent context:context];
    
    return itemMO;
}

@end
