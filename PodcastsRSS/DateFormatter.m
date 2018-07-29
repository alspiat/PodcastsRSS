//
//  DateFormatter.m
//  PodcastsRSS
//
//  Created by Алексей on 29.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DateFormatter.h"

static DateFormatter *_sharedFormatter = nil;

@interface DateFormatter()

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation DateFormatter

+ (DateFormatter *)sharedFormatter {
    if (!_sharedFormatter) {
        _sharedFormatter = [[DateFormatter alloc] init];
    }
    return _sharedFormatter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return self;
}

+ (NSDate *)getDateFromString:(NSString *)string withFormat:(NSString *)format {
    [DateFormatter.sharedFormatter.dateFormatter setDateFormat:format];
    return [DateFormatter.sharedFormatter.dateFormatter dateFromString:string];
}

+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)format {
    [DateFormatter.sharedFormatter.dateFormatter setDateFormat:format];
    return [DateFormatter.sharedFormatter.dateFormatter stringFromDate:date];
}

@end
