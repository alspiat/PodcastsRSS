//
//  ContentMO+CoreDataClass.h
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const ContentMOEntityName;

@class Content;

NS_ASSUME_NONNULL_BEGIN

@interface ContentMO : NSManagedObject

+ (NSFetchRequest<ContentMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *localLink;
@property (nullable, nonatomic, copy) NSString *webLink;

- (ContentMO *)initWithContent:(Content *)content context:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
