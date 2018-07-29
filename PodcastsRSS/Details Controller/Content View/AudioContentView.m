//
//  AudioContentView.m
//  PodcastsRSS
//
//  Created by Алексей on 29.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "AudioContentView.h"

@interface AudioContentView()

@property (strong, nonatomic) UIStackView *stackView;

@end

@implementation AudioContentView

- (void)setupSubviews {
    
    _stackView = [[UIStackView alloc] init];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.spacing = 10.0;
    self.stackView.distribution = UIStackViewDistributionFillProportionally;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.imageView];
    [self addSubview:self.stackView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.downloadButton];
    
    [self.stackView addArrangedSubview:self.authorLabel];
    [self.stackView addArrangedSubview:self.playerView];
    [self.stackView addArrangedSubview:self.durationLabel];
    
    [self.playerView setHidden:NO];
    
    [self setupAudioConstraints];
}

- (void)setupAudioConstraints {
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.imageView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.3],
                                              [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor],
                                              
                                              [self.stackView.centerYAnchor constraintEqualToAnchor:self.imageView.centerYAnchor],
                                              [self.stackView.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:15.0],
                                              [self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              
                                              [self.playerView.heightAnchor constraintEqualToConstant:43],
                                              [self.playerView.trailingAnchor constraintEqualToAnchor:self.stackView.trailingAnchor],
                                              
                                              [self.downloadButton.centerYAnchor constraintEqualToAnchor:self.durationLabel.centerYAnchor],
                                              [self.downloadButton.trailingAnchor constraintEqualToAnchor:self.durationLabel.trailingAnchor],
                                              [self.downloadButton.heightAnchor constraintEqualToConstant:20.0],
                                              [self.downloadButton.widthAnchor constraintEqualToAnchor:self.downloadButton.heightAnchor],
                                              
                                              [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.titleLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:15],
                                              
                                              [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
                                              ]];
}

@end
