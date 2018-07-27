//
//  ItemCoreData+CoreDataProperties.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ItemCoreData+CoreDataProperties.h"

@implementation ItemCoreData (CoreDataProperties)

+ (NSFetchRequest<ItemCoreData *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ItemCoreData"];
}

@dynamic guid;
@dynamic title;
@dynamic author;
@dynamic details;
@dynamic pubDate;
@dynamic duration;
@dynamic sourceType;
@dynamic imageContent;
@dynamic mediaContent;

@end
