//
//  ImageContentMO.m
//  PodcastsRSS
//
//  Created by Алексей on 31.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ImageContentMO.h"
#import "ImageContent.h"

NSString * const ImageContentMOEntityName = @"ImageContentMO";

@implementation ImageContentMO

+ (NSFetchRequest<ImageContentMO *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:ImageContentMOEntityName];
}

@dynamic localLink;
@dynamic webLink;
@dynamic previewLocalLink;

- (ImageContentMO *)initWithContent:(ImageContent *)content context:(NSManagedObjectContext *)context {
    ImageContentMO *imageContentMO = [NSEntityDescription insertNewObjectForEntityForName:ImageContentMOEntityName inManagedObjectContext:context];
    
    imageContentMO.webLink = content.webLink;
    imageContentMO.localLink = content.localLink;
    imageContentMO.previewLocalLink = content.previewLocalLink;
    
    return imageContentMO;
}

@end
