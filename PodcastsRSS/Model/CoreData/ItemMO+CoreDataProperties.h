//
//  ItemMO+CoreDataProperties.h
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ItemMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ItemMO (CoreDataProperties)

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

@end

NS_ASSUME_NONNULL_END
