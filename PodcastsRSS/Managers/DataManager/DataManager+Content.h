//
//  DataManager+Content.h
//  PodcastsRSS
//
//  Created by Алексей on 06.08.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DataManager.h"

@interface DataManager (Content)

+ (void)getPreviewImage:(Item*)item completionHandler:(BlockWithImage)completionHandler;
+ (void)getImage:(Item*)item completionHandler:(BlockWithImage)completionHandler;
+ (void)getMediaURL:(Item*)item completionHandler:(BlockWithURL)completionHandler;

@end
