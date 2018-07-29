//
//  Item.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemType.h"
#import "Content.h"
#import "ImageContent.h"

@interface Item : NSObject

@property (copy, nonatomic) NSString *guid;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *details;
@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *duration;
@property (strong, nonatomic) NSDate *pubDate;
@property (strong, nonatomic) ImageContent *imageContent;
@property (strong, nonatomic) Content *mediaContent;
@property (assign, nonatomic) ItemType sourceType;

@end
