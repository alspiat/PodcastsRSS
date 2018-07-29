//
//  ItemMO+CoreDataProperties.m
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ItemMO+CoreDataProperties.h"

@implementation ItemMO (CoreDataProperties)

+ (NSFetchRequest<ItemMO *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ItemMO"];
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

@end
