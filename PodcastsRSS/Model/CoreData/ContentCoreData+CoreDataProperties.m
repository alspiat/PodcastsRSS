//
//  ContentCoreData+CoreDataProperties.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ContentCoreData+CoreDataProperties.h"

@implementation ContentCoreData (CoreDataProperties)

+ (NSFetchRequest<ContentCoreData *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ContentCoreData"];
}

@dynamic localLink;
@dynamic webLink;

@end
