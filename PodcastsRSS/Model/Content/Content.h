//
//  Content.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContentMO.h"

@interface Content : NSObject

@property (copy, nonatomic) NSString *localLink;
@property (copy, nonatomic) NSString *webLink;

- (Content *)initWithWebLink:(NSString *)link;
- (Content *)initWithManagedObject:(ContentMO *)contentMO;

@end
