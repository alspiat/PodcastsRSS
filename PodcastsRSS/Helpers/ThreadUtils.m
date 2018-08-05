//
//  ThreadUtils.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 8/2/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ThreadUtils.h"


@implementation ThreadUtils

+ (void)performOnMain:(dispatch_block_t)block {
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)performInBackground:(dispatch_block_t)block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

@end
