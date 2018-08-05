//
//  ContentMO+CoreDataClass.m
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ContentMO+CoreDataClass.h"
#import "Content.h"

NSString * const ContentMOEntityName = @"ContentMO";

@implementation ContentMO

+ (NSFetchRequest<ContentMO *> *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:ContentMOEntityName];
}

@dynamic localLink;
@dynamic webLink;

- (ContentMO *)initWithContent:(Content *)content context:(NSManagedObjectContext *)context {
    ContentMO *contentMO = [NSEntityDescription insertNewObjectForEntityForName:ContentMOEntityName inManagedObjectContext:context];
    
    contentMO.webLink = content.webLink;
    contentMO.localLink = content.localLink;
    
    return contentMO;
}

@end
