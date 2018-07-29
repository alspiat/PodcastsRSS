//
//  ImageContentMO+CoreDataProperties.m
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ImageContentMO+CoreDataProperties.h"

@implementation ImageContentMO (CoreDataProperties)

+ (NSFetchRequest<ImageContentMO *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"ImageContentMO"];
}

@dynamic previewLocalLink;

@end
