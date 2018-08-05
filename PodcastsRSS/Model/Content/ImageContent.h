//
//  ImageContent.h
//  PodcastsRSS
//
//  Created by Алексей on 31.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageContentMO.h"

@interface ImageContent : NSObject

@property (copy, nonatomic) NSString *previewLocalLink;
@property (copy, nonatomic) NSString *localLink;
@property (copy, nonatomic) NSString *webLink;

- (ImageContent *)initWithWebLink:(NSString *)link;
- (ImageContent *)initWithManagedObject:(ImageContentMO *)contentMO;

@end
