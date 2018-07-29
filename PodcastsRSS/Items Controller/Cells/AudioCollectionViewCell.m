//
//  AudioCollectionViewCell.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "AudioCollectionViewCell.h"
#import "Item.h"
#import "FileManager.h"
#import "DataManager.h"

NSString * const audioItemCellIdentifier = @"audioItemCellIdentifier";

@implementation AudioCollectionViewCell

- (void)setupSubviews {
    [super setupSubviews];
    
    self.imageView.image = [UIImage imageNamed:@"audio"];
    self.imageView.layer.cornerRadius = 3.0;
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 5.0;
    stackView.distribution = UIStackViewDistributionFillProportionally;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.imageView];
    [self addSubview:self.durationLabel];
    [self addSubview:stackView];
    
    [stackView addArrangedSubview:self.authorLabel];
    [stackView addArrangedSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:@[[self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10.0],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:10.0],
                                              [self.imageView.widthAnchor constraintEqualToAnchor:self.imageView.heightAnchor],
                                              
                                              [self.durationLabel.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:-4.0],
                                              [self.durationLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-4.0],
                                              
                                              [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [stackView.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:10.0],
                                              [stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10.0]
                                              ]];
}

- (void)prepareForReuse {
    self.imageView.image = [UIImage imageNamed:@"audio"];
}

- (void)configureWithItem:(Item *)item {
    self.titleLabel.text = item.title;
    self.authorLabel.text = item.author;
    self.durationLabel.text = [NSString stringWithFormat:@" %@ ", item.duration];
    self.pubDateLabel.text = [NSString stringWithFormat:@"%@", item.pubDate];
    
    [DataManager getPreviewImage:item completionHandler:^(UIImage *image) {
        self.imageView.image = image;
    }];
}

@end
