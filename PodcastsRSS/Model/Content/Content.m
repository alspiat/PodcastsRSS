//
//  Content.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "Content.h"

@implementation Content

- (instancetype)initWithWebLink: (NSString *) link
{
    self = [super init];
    if (self) {
        self.webLink = link;
    }
    return self;
}

@end
