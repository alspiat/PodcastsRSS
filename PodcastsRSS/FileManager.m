//
//  FileManager.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "FileManager.h"

static FileManager *_sharedManager = nil;

static NSString * const previewsDirectory = @"Previews";
static NSString * const imagesDirectory = @"Images";
static NSString * const contentDirectory = @"Content";

@interface FileManager()

@property (strong, nonatomic) NSFileManager *fileManager;
@property (readwrite, copy, nonatomic) NSString *imagesDirPath;
@property (readwrite, copy, nonatomic) NSString *previewsDirPath;
@property (readwrite, copy, nonatomic) NSString *contentDirPath;

@end

@implementation FileManager

+ (FileManager *)sharedManager {
    if (!_sharedManager) {
        _sharedManager = [[FileManager alloc] init];
    }
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fileManager = NSFileManager.defaultManager;
        [self createDirectories];
    }
    return self;
}

- (void)createDirectories {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *previewsPath = [cacheDirectory stringByAppendingPathComponent:previewsDirectory];
    NSString *imagesPath = [documentsDirectory stringByAppendingPathComponent:imagesDirectory];
    NSString *contentPath = [documentsDirectory stringByAppendingPathComponent:contentDirectory];
    
    if ([self.fileManager createDirectoryAtPath:previewsPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        self.previewsDirPath = previewsPath;
    }
    
    if ([self.fileManager createDirectoryAtPath:imagesPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        self.imagesDirPath = imagesPath;
    }
    
    if ([self.fileManager createDirectoryAtPath:contentPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        self.contentDirPath = contentPath;
    }
}

@end
