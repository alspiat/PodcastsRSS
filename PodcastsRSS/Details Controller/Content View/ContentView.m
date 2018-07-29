//
//  ContentView.m
//  PodcastsRSS
//
//  Created by Алексей on 29.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.image = [UIImage imageNamed:@"video"];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.layer.cornerRadius = 5.0;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)authorLabel {
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _authorLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightUltraLight];
    }
    return _authorLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:25.0 weight:UIFontWeightBold];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [[UILabel alloc] init];
        _durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _durationLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightUltraLight];
    }
    return _durationLabel;
}

- (UIButton *)downloadButton {
    if (!_downloadButton) {
        _downloadButton = [[UIButton alloc] init];
        _downloadButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_downloadButton setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
    }
    return _downloadButton;
}

- (UIButton *)playButton {
    if (!_playButton) {
        _playButton = [[UIButton alloc] init];
        _playButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _playButton;
}

- (UIView *)playerView {
    if (!_playerView) {
        _playerView = [[UIView alloc] init];
        _playerView.translatesAutoresizingMaskIntoConstraints = NO;
        _playerView.layer.cornerRadius = 5.0;
        _playerView.clipsToBounds = YES;
    }
    return _playerView;
}

- (void)setupSubviews {
    
}
    
@end
