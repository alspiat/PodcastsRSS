//
//  FileManager.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

@property (readonly, copy, nonatomic) NSString *imagesDirPath;
@property (readonly, copy, nonatomic) NSString *previewsDirPath;
@property (readonly, copy, nonatomic) NSString *contentDirPath;

+ (FileManager *)sharedManager;

@end
