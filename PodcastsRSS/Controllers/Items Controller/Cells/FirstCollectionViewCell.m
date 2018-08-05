//
//  FirstCollectionViewCell.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/26/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "FirstCollectionViewCell.h"
#import "DataManager.h"

NSString * const firstItemCellIdentifier = @"firstItemCellIdentifier";

@implementation FirstCollectionViewCell

- (void)setupSubviews {
    [super setupSubviews];
    
    self.imageView.image = [UIImage imageNamed:@"video_placeholder"];

    
    self.authorLabel.font = [UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
    self.authorLabel.textColor = UIColor.whiteColor;
    
    self.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
    self.titleLabel.textColor = UIColor.whiteColor;
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];
    
    UIView *tmpView = [[UIView alloc] init];
    tmpView.translatesAutoresizingMaskIntoConstraints = NO;
    tmpView.backgroundColor = UIColor.blackColor;
    tmpView.alpha = 0.4;
    
    [self addSubview:self.imageView];
    [self addSubview:tmpView];
    [self addSubview:self.authorLabel];
    [self addSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:@[[self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              
                                              [tmpView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [tmpView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [tmpView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [tmpView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              
                                              [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:10.0],
                                              [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-10.0],
                                              [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:-10.0],
                                              
                                              [self.authorLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:10.0],
                                              [self.authorLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-10.0],
                                              [self.authorLabel.bottomAnchor constraintEqualToAnchor:self.titleLabel.topAnchor constant:-5.0]
                                              ]];
}

- (void)prepareForReuse {
    self.imageView.image = [UIImage imageNamed:@"video_placeholder"];
}

@end
