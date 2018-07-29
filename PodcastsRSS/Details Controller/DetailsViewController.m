//
//  DetailsViewController.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DetailsViewController.h"
#import "VideoContentView.h"
#import "AudioContentView.h"
#import "Item.h"
#import "DataManager.h"
#import "DateFormatter.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DetailsViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *detailsLabel;
@property (strong, nonatomic) ContentView *contentView;
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerViewController *playerController;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.scrollView];
    
    _detailsLabel = [[UILabel alloc] init];
    self.detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailsLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightThin];
    self.detailsLabel.numberOfLines = 0;
    [self.detailsLabel sizeToFit];
    [self.scrollView addSubview:self.detailsLabel];
    
    _playerController = [[AVPlayerViewController alloc] init];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                              [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                              [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
                                              ]];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(Item *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView {
    
    if (!self.isViewLoaded) {
        [self view];
    }
    
    if (self.detailItem) {
        
        [self.contentView removeFromSuperview];
        
        switch (self.detailItem.sourceType) {
            case ItemTypeTedtalks:
                _contentView = [[VideoContentView alloc] init];
                break;
            case ItemTypeSimplecast:
                _contentView = [[AudioContentView alloc] init];
                break;
        }
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView setupSubviews];
        [self.scrollView addSubview:self.contentView];
        
        [NSLayoutConstraint activateConstraints:@[[self.detailsLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:15],
                                                  [self.detailsLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-15],
                                                  [self.detailsLabel.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-20],
                                                  [self.detailsLabel.topAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:20]
                                                  ]];
        
        
        [NSLayoutConstraint activateConstraints:@[
                                                  [self.contentView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:15.0],
                                                  [self.contentView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:15.0],
                                                  [self.contentView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:15.0],
                                                  [self.contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-30.0]
                                                  ]];
        
        self.contentView.imageView.image = [UIImage imageNamed:@"video"];
        [DataManager getImage:self.detailItem completionHandler:^(UIImage *image) {
            self.contentView.imageView.image = image;
        }];
        
        self.contentView.authorLabel.text = [NSString stringWithFormat:@"%@ | %@", self.detailItem.author, [DateFormatter getStringFromDate:self.detailItem.pubDate withFormat:@"E, d MMM yyyy"]];
        self.contentView.titleLabel.text = self.detailItem.title;
        self.contentView.durationLabel.text = self.detailItem.duration;
        self.detailsLabel.text = self.detailItem.details;
        
        [self.contentView.playButton addTarget:self action:@selector(playButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView.downloadButton addTarget:self action:@selector(downloadButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        _player = [AVPlayer playerWithURL:[NSURL URLWithString:self.detailItem.mediaContent.webLink]];
        self.playerController.player = self.player;

        self.playerController.view.frame = self.contentView.playerView.frame;

        [self addChildViewController:self.playerController];
        [self.contentView.playerView addSubview:self.playerController.view];
        
    }
}

- (void)playButtonTapped:(id)sender {
    [self.contentView.playerView setHidden:NO];
    [self.player play];
    [sender setHidden:YES];
}

- (void)downloadButtonTapped:(id)sender {
    NSLog(@"Downloading starting!");
}

@end
