//
//  ContentView.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/26/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

- (void) setupSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.image = [UIImage imageNamed:@"vidos"];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    authorLabel.text = @"Leha Cooler";
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = @"Title title title title title title title title title title";
    titleLabel.numberOfLines = 0;
    [titleLabel sizeToFit];
    
    [self addSubview:imageView];
    [self addSubview:authorLabel];
    [self addSubview:titleLabel];
    
    [NSLayoutConstraint activateConstraints:@[
                                                [imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:50],
                                                [imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-50],
                                                [imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                                [imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                [imageView.heightAnchor constraintEqualToAnchor:imageView.widthAnchor multiplier:0.6],
  
                                                [authorLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
                                                [authorLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
                                                [authorLabel.topAnchor constraintEqualToAnchor:imageView.bottomAnchor constant:20],
                                                
                                                [titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10],
                                                [titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10],
                                                [titleLabel.topAnchor constraintEqualToAnchor:authorLabel.bottomAnchor constant:20],
                                                [titleLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0],
                                              ]];
}

@end
