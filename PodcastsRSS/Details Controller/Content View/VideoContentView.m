//
//  ContentView.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/26/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "VideoContentView.h"

@interface VideoContentView()

@property (strong, nonatomic) UIStackView *stackView;

@end

@implementation VideoContentView

- (void)setupSubviews {
    
    [self.playButton setImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
    
    [self addSubview:self.imageView];
    [self addSubview:self.authorLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.durationLabel];
    [self addSubview:self.playerView];
    [self addSubview:self.playButton];
    [self addSubview:self.downloadButton];
    
    [self.playerView setHidden:YES];
    
    [self setupVideoConstraints];
}

- (void)setupVideoConstraints {
    
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor multiplier:0.6],
                                              
                                              [self.playerView.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor],
                                              [self.playerView.topAnchor constraintEqualToAnchor:self.imageView.topAnchor],
                                              [self.playerView.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor],
                                              [self.playerView.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor],
                                              
                                              [self.playButton.centerYAnchor constraintEqualToAnchor:self.imageView.centerYAnchor],
                                              [self.playButton.centerXAnchor constraintEqualToAnchor:self.imageView.centerXAnchor],
                                              
                                              [self.downloadButton.centerYAnchor constraintEqualToAnchor:self.authorLabel.centerYAnchor],
                                              [self.downloadButton.trailingAnchor constraintEqualToAnchor:self.authorLabel.trailingAnchor],
                                              [self.downloadButton.heightAnchor constraintEqualToConstant:23.0],
                                              [self.downloadButton.widthAnchor constraintEqualToAnchor:self.downloadButton.heightAnchor],
                                              
                                              [self.authorLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.authorLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.authorLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:20],
                                              
                                              [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.titleLabel.topAnchor constraintEqualToAnchor:self.authorLabel.bottomAnchor constant:5],
                                              
                                              [self.durationLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.durationLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:5],
                                              [self.durationLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
                                              ]];
}

@end
