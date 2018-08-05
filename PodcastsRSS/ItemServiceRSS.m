//
//  ItemServiceRSS.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "RSSService.h"
#import "XMLParser.h"
#import "ItemXMLTagsConstants.h"
#import "ItemFilterConstants.h"

@interface RSSService()

@property (strong, nonatomic) NSArray<NSString *> *tags;
@property (strong, nonatomic) XMLParser *xmlParser;

@end

@implementation RSSService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tags = [[NSArray alloc] initWithObjects:guidField, titleField, authorField, detailsField, durationField, pubDateField, imageField, mediaField, nil];
        _xmlParser = [[XMLParser alloc] init];
    }
    return self;
}

- (void)fetchItemsByURL:(NSURL *)url type:(ItemType)type withCompletionHandler:(BlockWithItemsArray)completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSArray *dictItems = [self.xmlParser startParsingURL:url withItem:itemTag tags:self.tags];
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (NSDictionary *itemDict in dictItems) {
            Item *item = [[Item alloc] initWithDictionary: [self filteredItemDictonaryWithDictonary:itemDict] sourceType:type];
            [items addObject:item];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(items);
        });
        
    });
}

- (NSDictionary *)filteredItemDictonaryWithDictonary:(NSDictionary *)itemDict {
    NSMutableDictionary *filteredItemDict = [[NSMutableDictionary alloc] initWithDictionary:itemDict];

    filteredItemDict[guidField][valueField] = [self filteredStringWithString:itemDict[guidField][valueField]];
    filteredItemDict[titleField] = [self filteredStringWithString:itemDict[titleField]];
    
    if ([filteredItemDict[titleField] containsString:separatorSymbol]) {
        NSInteger titleLastIndex = [filteredItemDict[titleField] rangeOfString:separatorSymbol].location;
        filteredItemDict[titleField] = [filteredItemDict[titleField] substringToIndex: titleLastIndex];
    }
    
    filteredItemDict[authorField]= [self filteredStringWithString:itemDict[authorField]];
    filteredItemDict[detailsField] = [self filteredStringWithString:itemDict[detailsField]];
    filteredItemDict[durationField]= [[self filteredStringWithString:itemDict[durationField]] stringByReplacingOccurrencesOfString:doubleZeroSymbol withString:emptyString];
    
    return filteredItemDict;
}

- (NSString *) filteredStringWithString:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:newLineSymbol withString:emptyString];
    string = [string stringByReplacingOccurrencesOfString:doubleSpaceSymbol withString:emptyString];
    string = [string stringByReplacingOccurrencesOfString:doubleDashSymbol withString:dashSymbol];
    
    return string;
}

@end
