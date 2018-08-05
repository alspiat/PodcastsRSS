//
//  NSDate+FormatString.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/31/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FormatString)

+ (NSDate *)dateFromString:(NSString *)dateString;
- (NSString *)formattedString;

@end
