//
//  ImageContent.m
//  PodcastsRSS
//
//  Created by Алексей on 31.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ImageContent.h"

@implementation ImageContent

- (ImageContent*)initWithWebLink:(NSString *)link {
    ImageContent *imageContent = [[ImageContent alloc] init];
    imageContent.webLink = link;
    
    return imageContent;
}

- (ImageContent*)initWithManagedObject:(ImageContentMO *)imageContentMO {
    ImageContent *imageContent = [[ImageContent alloc] init];
    
    imageContent.webLink = imageContentMO.webLink;
    imageContent.localLink = imageContentMO.localLink;
    imageContent.previewLocalLink = imageContentMO.previewLocalLink;
    
    return imageContent;
}

@end
