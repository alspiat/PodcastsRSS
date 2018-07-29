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
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.image = [UIImage imageNamed:@"video"];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.layer.cornerRadius = 5.0;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    
    _authorLabel = [[UILabel alloc] init];
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightUltraLight];
    
    _titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:25.0 weight:UIFontWeightBold];
    [self.titleLabel sizeToFit];
    
    _durationLabel = [[UILabel alloc] init];
    self.durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.durationLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightUltraLight];
    
    UIButton *downloadButton = [[UIButton alloc] init];
    downloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    [downloadButton setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
    
    [self addSubview:self.imageView];
    [self addSubview:self.authorLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.durationLabel];
    [self addSubview:downloadButton];
    
    [NSLayoutConstraint activateConstraints:@[
                                                [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
                                                [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant: 15],
                                                [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                                [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor multiplier:0.6],
  
                                                [self.authorLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
                                                [self.authorLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15],
                                                [self.authorLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:20],
                                                
                                                [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
                                                [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15],
                                                [self.titleLabel.topAnchor constraintEqualToAnchor:self.authorLabel.bottomAnchor constant:5],
                                                
                                                [self.durationLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15],
                                                [self.durationLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:5],
                                                
                                                [downloadButton.leadingAnchor constraintEqualToAnchor:self.durationLabel.trailingAnchor constant:10],
                                                [downloadButton.centerYAnchor constraintEqualToAnchor:self.durationLabel.centerYAnchor constant:0],
                                                [downloadButton.widthAnchor constraintEqualToConstant:18],
                                                [downloadButton.heightAnchor constraintEqualToConstant:18],
                                                [downloadButton.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
                                              ]];
}

@end
