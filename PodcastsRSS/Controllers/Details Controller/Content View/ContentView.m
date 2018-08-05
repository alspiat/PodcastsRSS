//
//  ContentView.m
//  PodcastsRSS
//
//  Created by Алексей on 29.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ContentView.h"
#import "Item.h"
#import "NSDate+FormatString.h"
#import "ContentViewConstants.h"

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.layer.cornerRadius = contentViewCornerRadius;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorLabel.font = [UIFont systemFontOfSize:contentViewTextSizeLittle weight:UIFontWeightUltraLight];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:contentViewTextSizeLarge weight:UIFontWeightBold];
    [self.titleLabel sizeToFit];
    
    self.durationLabel = [[UILabel alloc] init];
    self.durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.durationLabel.font = [UIFont systemFontOfSize:contentViewTextSizeLittle weight:UIFontWeightUltraLight];
    
    self.activityButton = [[UIButton alloc] init];
    self.activityButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.playButton = [[UIButton alloc] init];
    self.playButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.playerView = [[UIView alloc] init];
    self.playerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.playerView.layer.cornerRadius = contentViewCornerRadius;
    self.playerView.clipsToBounds = YES;
    
    self.progressView = [[UIProgressView alloc] init];
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.progressView setHidden:YES];
}

- (void)configureWithItem:(Item *)item {
    self.authorLabel.text = [NSString stringWithFormat:@"%@ | %@", item.author, [item.pubDate formattedString]];
    self.titleLabel.text = item.title;
    self.durationLabel.text = item.duration;
}
    
@end
