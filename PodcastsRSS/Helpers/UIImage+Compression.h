//
//  UIImage+Compression.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compression)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size;
+ (NSData *)dataWithImage:(UIImage *)image compressedWithFactor:(float)compressFactor;

@end
