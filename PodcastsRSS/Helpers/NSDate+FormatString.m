//
//  NSDate+FormatString.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/31/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "NSDate+FormatString.h"

static NSString * const stringToDateFormat = @"E, dd MMM yyyy HH:mm:ss Z";
static NSString * const dateToStringFormat = @"E, dd MMM yyyy";

@implementation NSDate (FormatString)

+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:stringToDateFormat];
    
    return [dateFormatter dateFromString:dateString];
}

- (NSString *)formattedString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateToStringFormat];
    
    return [dateFormatter stringFromDate:self];
}

@end
