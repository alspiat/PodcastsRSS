//
//  FileManager.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

+ (FileManager *)sharedManager;

+ (NSString *)imagesFolder;
+ (NSString *)previewsFolder;
+ (NSString *)contentFolder;

- (NSString *)getFullPathFolder:(NSString *)folder filename:(NSString *)filename;
- (NSString *)getFilenameFromStringURL:(NSString *)urlString;

- (BOOL)createFile:(NSString *)fileName withData:(NSData *)data atFolder:(NSString *)folder;
- (BOOL)fileExistsAtFolder:(NSString *)folder forName:(NSString *)filename;
- (BOOL)moveTempFile:(NSString *)tempFilename toFolder:(NSString *)folder withName:(NSString *)filename;
- (BOOL)deleteFile:(NSString *)filename atFolder:(NSString *)folder;

@end
