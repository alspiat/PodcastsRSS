//
//  ContentMO+CoreDataProperties.m
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ContentMO+CoreDataProperties.h"

@implementation ContentMO (CoreDataProperties)

+ (NSFetchRequest<ContentMO *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ContentMO"];
}

@dynamic localLink;
@dynamic webLink;

@end
