//
//  ItemCoreData+CoreDataProperties.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ItemCoreData+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ItemCoreData (CoreDataProperties)

+ (NSFetchRequest<ItemCoreData *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *guid;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSString *details;
@property (nullable, nonatomic, copy) NSDate *pubDate;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nonatomic) int16_t sourceType;
@property (nullable, nonatomic, retain) ContentCoreData *imageContent;
@property (nullable, nonatomic, retain) ContentCoreData *mediaContent;

@end

NS_ASSUME_NONNULL_END
