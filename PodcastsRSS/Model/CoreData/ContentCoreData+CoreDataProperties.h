//
//  ContentCoreData+CoreDataProperties.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ContentCoreData+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ContentCoreData (CoreDataProperties)

+ (NSFetchRequest<ContentCoreData *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *localLink;
@property (nullable, nonatomic, copy) NSString *webLink;

@end

NS_ASSUME_NONNULL_END
