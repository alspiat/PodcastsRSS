//
//  ContentMO+CoreDataProperties.h
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ContentMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContentMO (CoreDataProperties)

+ (NSFetchRequest<ContentMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *localLink;
@property (nullable, nonatomic, copy) NSString *webLink;

@end

NS_ASSUME_NONNULL_END
