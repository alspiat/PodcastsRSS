//
//  Downloader.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 8/2/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "Downloader.h"
#import "ThreadUtils.h"
#import "FileManager.h"

@interface Downloader() <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate>

@property (readwrite, strong, nonatomic) NSProgress* progress;
@property (nonatomic, copy) BlockWithString downloadingFinishedBlock;

@end

@implementation Downloader

+ (void)downloadDataWithURL:(NSString *)urlString withCompletionHandler:(BlockWithData)completionHandler {
    [ThreadUtils performInBackground:^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        completionHandler(data);
    }];
}

- (void)downloadFileWithURL:(NSString *)path withCompletionHandler:(BlockWithString)completionHandler {
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *downloadTask = [urlSession downloadTaskWithURL:[NSURL URLWithString:path]];
    self.progress = downloadTask.progress;
    self.downloadingFinishedBlock = completionHandler;
    [downloadTask resume];
}

// MARK: - NSURLSession download task delegate methods

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    if ([FileManager.sharedManager moveTempFile:location.lastPathComponent toFolder:FileManager.contentFolder withName:downloadTask.originalRequest.URL.lastPathComponent]) {
        [ThreadUtils performOnMain:^{
            self.downloadingFinishedBlock(downloadTask.originalRequest.URL.lastPathComponent);
        }];
    }
}

@end
