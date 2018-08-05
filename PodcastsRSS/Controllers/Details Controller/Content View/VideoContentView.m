//
//  ContentView.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/26/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "VideoContentView.h"
#import "ContentViewConstants.h"

@interface VideoContentView()

@property (strong, nonatomic) UIStackView *stackView;

@end

@implementation VideoContentView

- (void)setupSubviews {
    [super setupSubviews];
    self.imageView.image = [UIImage imageNamed:videoPlaceholder];
    [self.playButton setImage:[UIImage imageNamed:playButtonImageName] forState:UIControlStateNormal];
    
    [self addSubview:self.imageView];
    [self addSubview:self.progressView];
    [self addSubview:self.authorLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.durationLabel];
    [self addSubview:self.playerView];
    [self addSubview:self.playButton];
    [self addSubview:self.activityButton];
    
    [self.playerView setHidden:YES];
    
    [self setupVideoConstraints];
}

- (void)setupVideoConstraints {
    
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor multiplier:videoContentViewImageRation],
                                              
                                              [self.playerView.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor],
                                              [self.playerView.topAnchor constraintEqualToAnchor:self.imageView.topAnchor],
                                              [self.playerView.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor],
                                              [self.playerView.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor],
                                              
                                              [self.playButton.centerYAnchor constraintEqualToAnchor:self.imageView.centerYAnchor],
                                              [self.playButton.centerXAnchor constraintEqualToAnchor:self.imageView.centerXAnchor],
                                              
                                              [self.activityButton.centerYAnchor constraintEqualToAnchor:self.authorLabel.centerYAnchor],
                                              [self.activityButton.trailingAnchor constraintEqualToAnchor:self.authorLabel.trailingAnchor],
                                              [self.activityButton.heightAnchor constraintEqualToConstant:videoContentViewActivityButtonSize],
                                              [self.activityButton.widthAnchor constraintEqualToAnchor:self.activityButton.heightAnchor],
                                              
                                              [self.progressView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.progressView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.progressView.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:videoContentViewRowSpacing],
                                              
                                              [self.authorLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.authorLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.authorLabel.topAnchor constraintEqualToAnchor:self.progressView.bottomAnchor constant:2 * videoContentViewRowSpacing],
                                              
                                              [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.titleLabel.topAnchor constraintEqualToAnchor:self.authorLabel.bottomAnchor constant:videoContentViewRowSpacing],
                                              
                                              [self.durationLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.durationLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:videoContentViewRowSpacing],
                                              [self.durationLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
                                              ]];
}

@end
