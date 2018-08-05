//
//  DataManager+Fetching.h
//  PodcastsRSS
//
//  Created by Алексей on 06.08.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DataManager.h"

@interface DataManager (Fetching)

+ (void)fetchDataWithCompletionHandler:(BlockWithItemsArray)completionHandler;
+ (void)fetchOfflineDataWithCompletionHandler:(BlockWithItemsArray)completionHandler;

@end
