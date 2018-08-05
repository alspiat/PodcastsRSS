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

@property (readwrite, copy, nonatomic) NSString *imagesFolderPath;
@property (readwrite, copy, nonatomic) NSString *previewsFolderPath;
@property (readwrite, copy, nonatomic) NSString *contentFolderPath;

@end

@implementation FileManager

+ (FileManager *)sharedManager {
    if (!_sharedManager) {
        _sharedManager = [[FileManager alloc] init];
    }
    return _sharedManager;
}

+ (NSString *)imagesFolder {
    return FileManager.sharedManager.imagesFolderPath;
}

+ (NSString *)previewsFolder {
    return FileManager.sharedManager.previewsFolderPath;
}

+ (NSString *)contentFolder {
    return FileManager.sharedManager.contentFolderPath;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDirectories];
    }
    return self;
}

- (NSFileManager *)fileManager {
    return NSFileManager.defaultManager;
}

- (NSString *)getFullPathFolder:(NSString *)folder filename:(NSString *)filename {
    return [folder stringByAppendingPathComponent:filename];
}

- (NSString *)getFilenameFromStringURL:(NSString *)urlString {
    NSString *filename = [NSURL URLWithString:urlString].lastPathComponent;
    return filename;
}

- (BOOL)createFile:(NSString *)fileName withData:(NSData *)data atFolder:(NSString *)folder {
    NSString *filePath = [self getFullPathFolder:folder filename:fileName];
    return [self.fileManager createFileAtPath:filePath contents:data attributes:nil];
}

- (BOOL)fileExistsAtFolder:(NSString *)folder forName:(NSString *)filename {
    NSString *filePath = [self getFullPathFolder:folder filename:filename];
    return [self.fileManager fileExistsAtPath:filePath];
}

- (BOOL)moveTempFile:(NSString *)tempFilename toFolder:(NSString *)folder withName:(NSString *)filename {
    NSString *sourcePath = [self getFullPathFolder:NSTemporaryDirectory() filename:tempFilename];
    NSString *destinationPath = [self getFullPathFolder:FileManager.contentFolder filename:filename];
    return [self.fileManager moveItemAtPath:sourcePath toPath:destinationPath error:nil];
}

- (BOOL)deleteFile:(NSString *)filename atFolder:(NSString *)folder {
    NSString *filePath = [self getFullPathFolder:folder filename:filename];
    NSLog(@"Filepath: %@", filePath);
    BOOL success = NO;
    if (filename) {
        success = [self.fileManager removeItemAtPath:filePath error:nil];
    }
    return success;
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
        self.previewsFolderPath = previewsPath;
    }
    
    if ([self.fileManager createDirectoryAtPath:imagesPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        self.imagesFolderPath = imagesPath;
    }
    
    if ([self.fileManager createDirectoryAtPath:contentPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        self.contentFolderPath = contentPath;
    }
}

@end
