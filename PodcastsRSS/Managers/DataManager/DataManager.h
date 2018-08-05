//
//  DataManager.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RssService.h"

typedef void (^BlockWithImage)(UIImage *);
typedef void (^BlockWithURL)(NSURL *);

@class Item;

@interface DataManager : NSObject

+ (void)saveItemForOffline:(Item *)item progressView:(UIProgressView *)progress withCompletionHandler:(void(^)(void))completionHandler;
+ (void)removeItemFromOffline:(Item *)item;

@end
