//
//  AudioContentView.m
//  PodcastsRSS
//
//  Created by Алексей on 29.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "AudioContentView.h"
#import "ContentViewConstants.h"

@interface AudioContentView()

@property (strong, nonatomic) UIStackView *stackView;

@end

@implementation AudioContentView

- (void)setupSubviews {
    [super setupSubviews];
    self.imageView.image = [UIImage imageNamed:audioPlaceholder];
    
    _stackView = [[UIStackView alloc] init];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.spacing = contentViewRowSpacing;
    self.stackView.distribution = UIStackViewDistributionFillProportionally;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.imageView];
    [self addSubview:self.stackView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.activityButton];
    
    [self.stackView addArrangedSubview:self.authorLabel];
    [self.stackView addArrangedSubview:self.playerView];
    [self.stackView addArrangedSubview:self.progressView];
    [self.stackView addArrangedSubview:self.durationLabel];
    
    [self.playerView setHidden:NO];
    
    [self setupAudioConstraints];
}

- (void)setupAudioConstraints {
    [NSLayoutConstraint activateConstraints:@[
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.imageView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:audioContentViewImageSizeFactor],
                                              [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor],
                                              
                                              [self.stackView.centerYAnchor constraintEqualToAnchor:self.imageView.centerYAnchor],
                                              [self.stackView.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:audioContentViewRowOffset],
                                              [self.stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              
                                              [self.playerView.heightAnchor constraintEqualToConstant:audioContentViewPlayerHeight],
                                              [self.playerView.trailingAnchor constraintEqualToAnchor:self.stackView.trailingAnchor],
                                              
                                              [self.activityButton.centerYAnchor constraintEqualToAnchor:self.durationLabel.centerYAnchor],
                                              [self.activityButton.trailingAnchor constraintEqualToAnchor:self.durationLabel.trailingAnchor],
                                              [self.activityButton.heightAnchor constraintEqualToConstant:audioContentViewActivityButtonSize],
                                              [self.activityButton.widthAnchor constraintEqualToAnchor:self.activityButton.heightAnchor],
                                              
                                              [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
                                              [self.titleLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:audioContentViewRowOffset],
                                              
                                              [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
                                              ]];
}

@end
