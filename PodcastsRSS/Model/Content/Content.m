//
//  Content.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "Content.h"

@implementation Content

- (Content*)initWithWebLink:(NSString *)link {
    Content *content = [[Content alloc] init];
    content.webLink = link;
    
    return content;
}

- (Content*)initWithManagedObject:(ContentMO *)contentMO {
    Content *content = [[Content alloc] init];
    
    content.webLink = contentMO.webLink;
    content.localLink = contentMO.localLink;
    
    return content;
}

@end
