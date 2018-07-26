//
//  FirstCollectionViewCell.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/26/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "FirstCollectionViewCell.h"
#import "Item.h"

NSString * const firstItemCellIdentifier = @"firstItemCellIdentifier";

@interface FirstCollectionViewCell()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *authorLabel;

@end

@implementation FirstCollectionViewCell

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

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"video"]];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightBold];
        _titleLabel.textColor = UIColor.whiteColor;
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _authorLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightLight];
        _authorLabel.textColor = UIColor.whiteColor;
    }
    return _authorLabel;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.authorLabel];
    
    [NSLayoutConstraint activateConstraints:@[[self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
                                              [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
                                              [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                              [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
                                              
                                              [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:10.0],
                                              [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-10.0],
                                              [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:-10.0],
                                              
                                              [self.authorLabel.leadingAnchor constraintEqualToAnchor:self.imageView.leadingAnchor constant:10.0],
                                              [self.authorLabel.trailingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:-10.0],
                                              [self.authorLabel.bottomAnchor constraintEqualToAnchor:self.titleLabel.topAnchor constant:-5.0]
                                              ]];
}

- (void)configureWithItem:(Item *)item {
    self.titleLabel.text = item.title;
    self.authorLabel.text = item.author;
}

@end
