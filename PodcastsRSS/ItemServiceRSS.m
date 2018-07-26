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

static NSString * const itemTag = @"item";

static NSString * const guidField = @"guid";
static NSString * const titleField = @"title";
static NSString * const authorField = @"itunes:author";
static NSString * const pubDateField = @"pubDate";
static NSString * const durationField = @"itunes:duration";
static NSString * const detailsField = @"itunes:summary";
static NSString * const valueField = @"value";

static NSString * const imageField = @"itunes:image";
static NSString * const imageURLField = @"href";

static NSString * const mediaField = @"enclosure";
static NSString * const mediaURLField = @"url";

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
            Item *item = [[Item alloc] init];
            item.guid = itemDict[guidField][valueField];
            item.title = itemDict[titleField];
            item.author = itemDict[authorField];
            item.details = itemDict[detailsField];
            item.duration = itemDict[durationField];
            
            NSString *dateStr = itemDict[pubDateField];
            
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"E, dd MMM yyyy HH:mm:ss Z"];
            NSDate *date = [dateFormat dateFromString:dateStr];
            
            item.pubDate = date;
            item.imageContent = [[Content alloc] initWithWebLink: itemDict[imageField][imageURLField]];
            item.mediaContent = [[Content alloc] initWithWebLink: itemDict[mediaField][mediaURLField]];
            item.type = type;
            
            [items addObject:item];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(items);
        });
        
    });
}

@end
