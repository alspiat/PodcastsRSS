//
//  ImageContentMO.h
//  PodcastsRSS
//
//  Created by Алексей on 31.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const ImageContentMOEntityName;

@class ImageContent;

NS_ASSUME_NONNULL_BEGIN

@interface ImageContentMO : NSManagedObject

+ (NSFetchRequest<ImageContentMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *localLink;
@property (nullable, nonatomic, copy) NSString *webLink;
@property (nullable, nonatomic, copy) NSString *previewLocalLink;

- (ImageContentMO *)initWithContent:(ImageContent *)content context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
