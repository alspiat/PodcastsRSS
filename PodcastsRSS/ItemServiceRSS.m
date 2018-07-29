//
//  ItemServiceRSS.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ItemServiceRSS.h"
#import "XMLParser.h"
#import "Item.h"
#import "ItemXMLTagsConstants.h"
#import "ItemFilterConstants.h"
#import "DateFormatter.h"

@interface ItemServiceRSS()

@property (strong, nonatomic) NSArray<NSString *> *tags;

@end

@implementation ItemServiceRSS

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tags = [[NSArray alloc] initWithObjects:guidField, titleField, authorField, detailsField, durationField, pubDateField, imageField, mediaField, nil];
    }
    return self;
}

- (void)fetchTedtalksItemsWithCompletionHandler:(void (^)(NSArray<Item *> *))completionHandler {
    NSURL *tedtalksURL= [NSURL URLWithString: @"https://feeds.feedburner.com/tedtalks_video"];
    [self fetchByURL:tedtalksURL itemsType:ItemTypeTedtalks withCompletionHandler:completionHandler];
}

- (void)fetchSimplecastItemsWithCompletionHandler:(void (^)(NSArray<Item *> *))completionHandler {
    NSURL *simplecastURL= [NSURL URLWithString: @"https://rss.simplecast.com/podcasts/4669/rss"];
     [self fetchByURL:simplecastURL itemsType:ItemTypeSimplecast withCompletionHandler:completionHandler];
}

- (void)fetchByURL:(NSURL *)url itemsType:(ItemType)type withCompletionHandler:(void (^)(NSArray<Item *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        XMLParser *xmlParser = [[XMLParser alloc] initWithURL:url forItem:itemTag];
        NSArray *dictItems = [xmlParser parseTags:self.tags];
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (NSDictionary *itemDict in dictItems) {
            Item *item = [self itemWithDictionary:itemDict];
            item.sourceType = type;
            
            [items addObject:item];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(items);
        });
        
    });
}

- (Item *)itemWithDictionary:(NSDictionary *)itemDict {
    
    Item *item = [[Item alloc] init];
    item.guid = [self filteredStringWithString:itemDict[guidField][valueField]];
    item.title = [self filteredStringWithString:itemDict[titleField]];
    
    if ([item.title containsString:separatorSymbol]) {
        NSInteger titleLastIndex = [item.title rangeOfString:separatorSymbol].location;
        item.title = [item.title substringToIndex: titleLastIndex];
    }

    item.author = [self filteredStringWithString:itemDict[authorField]];
    item.details = [self filteredStringWithString:itemDict[detailsField]];
    item.duration = [itemDict[durationField] stringByReplacingOccurrencesOfString:doubleZeroSymbol withString:emptyString];

    item.pubDate = [DateFormatter getDateFromString:itemDict[pubDateField] withFormat:@"E, dd MMM yyyy HH:mm:ss Z"];
    item.imageContent = [[ImageContent alloc] initWithWebLink: itemDict[imageField][imageURLField]];
    item.mediaContent = [[Content alloc] initWithWebLink: itemDict[mediaField][mediaURLField]];
    
    return item;
}

- (NSString *) filteredStringWithString:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:newLineSymbol withString:emptyString];
    string = [string stringByReplacingOccurrencesOfString:doubleSpaceSymbol withString:emptyString];
    string = [string stringByReplacingOccurrencesOfString:doubleDashSymbol withString:dashSymbol];
    
    return string;
}
@end
