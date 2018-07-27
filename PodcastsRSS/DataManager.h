//
//  DataManager.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Item;

@interface DataManager : NSObject

+ (void) getItemImage:(Item*)item completionHandler: (void(^)(UIImage *image)) completionHandler;

@end
