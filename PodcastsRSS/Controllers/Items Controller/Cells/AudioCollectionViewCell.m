//
//  AudioCollectionViewCell.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "AudioCollectionViewCell.h"
#import "DataManager.h"
#import "CellConstants.h"

NSString * const audioItemCellIdentifier = @"audioItemCellIdentifier";

@implementation AudioCollectionViewCell

- (void)setupSubviews {
    [super setupSubviews];
    
    self.imageView.image = [UIImage imageNamed:audioPlaceholder];
    self.imageView.layer.cornerRadius = cellCornerRadius;
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = cellRowSpacing;
    stackView.distribution = UIStackViewDistributionFillProportionally;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.imageView];
    [self addSubview:self.durationLabel];
    [self addSubview:stackView];
    
    [stackView addArrangedSubview:self.authorLabel];
    [stackView addArrangedSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:@[[self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:cellContentOffset],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:cellContentOffset],
                                              [self.imageView.widthAnchor constraintEqualToConstant:cellImageViewWidth],
                                              
                                              [self.durationLabel.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:-cellDurationOffset],
                                              [self.durationLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-cellDurationOffset],
                                              
                                              [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [stackView.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:cellContentOffset],
                                              [stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-cellContentOffset]
                                              ]];
}

- (void)prepareForReuse {
    self.imageView.image = [UIImage imageNamed:audioPlaceholder];
}

@end
