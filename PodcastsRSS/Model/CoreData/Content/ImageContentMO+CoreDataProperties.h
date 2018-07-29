//
//  ImageContentMO+CoreDataProperties.h
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import "ImageContentMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ImageContentMO (CoreDataProperties)

+ (NSFetchRequest<ImageContentMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *previewLocalLink;

@end

NS_ASSUME_NONNULL_END
