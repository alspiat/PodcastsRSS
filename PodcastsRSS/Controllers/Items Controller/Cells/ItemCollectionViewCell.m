//
//  ItemCollectionViewCell.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ItemCollectionViewCell.h"
#import "Item.h"
#import "DataManager.h"
#import "CellConstants.h"

@interface ItemCollectionViewCell()

@property (strong, nonatomic) ImageContent *currentImageContent;

@end

@implementation ItemCollectionViewCell

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
    self.backgroundColor = UIColor.whiteColor;
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.durationLabel = [[UILabel alloc] init];
    self.durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.durationLabel.font = [UIFont systemFontOfSize:cellTextSizeLittle];
    self.durationLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    self.durationLabel.textColor = UIColor.whiteColor;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.font = [UIFont systemFontOfSize:cellTextSizeLarge weight:UIFontWeightBold];
    self.titleLabel.numberOfLines = 3;
    
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorLabel.font = [UIFont systemFontOfSize:cellTextSizeLarge weight:UIFontWeightLight];
}

- (void)configureImage:(UIImage *)image withImageContent:(ImageContent *)imageContent {
    if (imageContent == self.currentImageContent) {
        self.imageView.image = image;
    }
}

- (void)configureWithItem:(Item *)item {
    self.currentImageContent = item.imageContent;
    
    self.titleLabel.text = item.title;
    self.authorLabel.text = item.author;
    self.durationLabel.text = [NSString stringWithFormat:@" %@ ", item.duration];
    self.pubDateLabel.text = [NSString stringWithFormat:@"%@", item.pubDate];
}

@end
