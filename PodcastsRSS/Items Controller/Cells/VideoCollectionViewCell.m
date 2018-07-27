//
//  VideoCollectionViewCell.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "VideoCollectionViewCell.h"
#import "Item.h"
#import "FileManager.h"
#import "DataManager.h"

NSString * const videoItemCellIdentifier = @"videoItemCellIdentifier";

@implementation VideoCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.imageView.image = [UIImage imageNamed:@"video"];
    
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
                                              [self.imageView.widthAnchor constraintEqualToConstant:100.0],
                                              
                                              [self.durationLabel.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:-4.0],
                                              [self.durationLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-4.0],
                                              
                                              [stackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [stackView.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:10.0],
                                              [stackView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10.0]
                                              ]];
}

- (void)prepareForReuse {
    self.imageView.image = [UIImage imageNamed:@"video"];
}

- (void)configureWithItem:(Item *)item {
    self.titleLabel.text = item.title;
    self.authorLabel.text = item.author;
    self.durationLabel.text = [NSString stringWithFormat:@" %@ ", item.duration];
    self.pubDateLabel.text = [NSString stringWithFormat:@"%@", item.pubDate];
    
    [DataManager getItemImage:item completionHandler:^(UIImage *image) {
        self.imageView.image = image;
    }];
}

@end
