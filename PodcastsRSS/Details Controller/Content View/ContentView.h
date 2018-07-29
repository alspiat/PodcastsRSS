//
//  ContentView.h
//  PodcastsRSS
//
//  Created by Алексей on 29.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentView : UIView

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *durationLabel;
@property (strong, nonatomic) UIButton *downloadButton;
@property (strong, nonatomic) UIButton *playButton;
@property (strong, nonatomic) UIView *playerView;

- (void)setupSubviews;

@end
