//
//  ThreadUtils.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 8/2/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadUtils : NSObject

+ (void)performOnMain:(dispatch_block_t)block;
+ (void)performInBackground:(dispatch_block_t)block;

@end
