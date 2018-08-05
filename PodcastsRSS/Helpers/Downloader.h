//
//  Downloader.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 8/2/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^BlockWithString)(NSString *);
typedef void (^BlockWithData)(NSData *);

@interface Downloader : NSObject

@property (readonly, strong, nonatomic) NSProgress* progress;

+ (void)downloadDataWithURL:(NSString *)urlString withCompletionHandler:(BlockWithData)completionHandler;
- (void)downloadFileWithURL:(NSString *)path withCompletionHandler:(BlockWithString)completionHandler;

@end
