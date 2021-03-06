//
//  ItemCollectionViewCell.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@class ImageContent;

@interface ItemCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *pubDateLabel;
@property (strong, nonatomic) UILabel *durationLabel;

- (void)setupSubviews;
- (void)configureWithItem:(Item*)item;
- (void)configureImage:(UIImage *)image withImageContent:(ImageContent *)imageContent;

@end
