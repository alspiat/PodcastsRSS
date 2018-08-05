//
//  ItemMO+CoreDataClass.h
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ContentMO.h"
#import "ImageContentMO.h"

extern NSString * const ItemMOEntityName;

@class Item;

NS_ASSUME_NONNULL_BEGIN

@interface ItemMO : NSManagedObject

+ (NSFetchRequest<ItemMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSString *details;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nullable, nonatomic, copy) NSString *guid;
@property (nullable, nonatomic, copy) NSDate *pubDate;
@property (nonatomic) int16_t sourceType;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) ImageContentMO *imageContent;
@property (nullable, nonatomic, retain) ContentMO *mediaContent;

- (ItemMO *)initWithItem:(Item *)item context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
