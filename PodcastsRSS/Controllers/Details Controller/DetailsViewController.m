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

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DetailsViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *detailsLabel;
@property (strong, nonatomic) ContentView *contentView;
@property (strong, nonatomic) AVPlayerViewController *playerController;
@property (strong, nonatomic) AVPlayer *player;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.scrollView];
    
    self.detailsLabel = [[UILabel alloc] init];
    self.detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailsLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightThin];
    self.detailsLabel.numberOfLines = 0;
    [self.scrollView addSubview:self.detailsLabel];
    
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
        
        [self.playerController removeFromParentViewController];
        [self setupContentView];
        [self.detailsLabel sizeToFit];
        
        self.playerController = [[AVPlayerViewController alloc] init];
        self.playerController.view.frame = self.contentView.playerView.frame;
        [self addChildViewController:self.playerController];
        [self.contentView.playerView addSubview:self.playerController.view];
        
        [self.contentView.playButton addTarget:self action:@selector(playButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView.activityButton addTarget:self action:@selector(activityButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        if (self.detailItem.isSaved) {
            [self.contentView.activityButton setImage:[UIImage imageNamed:@"delete_button"] forState:UIControlStateNormal];
        } else {
            [self.contentView.activityButton setImage:[UIImage imageNamed:@"download_button"] forState:UIControlStateNormal];
        }
        
        [self.contentView configureWithItem:self.detailItem];
        self.detailsLabel.text = self.detailItem.details;
        
        [DataManager getImage:self.detailItem completionHandler:^(UIImage *image) {
            self.contentView.imageView.image = image;
        }];
        
        [DataManager getMediaURL:self.detailItem completionHandler:^(NSURL *url) {
            self.player = [AVPlayer playerWithURL:url];
            self.playerController.player = self.player;
        }];
        
    }
}

- (void)setupContentView {
    [self.contentView removeFromSuperview];
    
    switch (self.detailItem.sourceType) {
        case ItemTypeTedtalks:
            self.contentView = [[VideoContentView alloc] init];
            break;
        case ItemTypeSimplecast:
            self.contentView = [[AudioContentView alloc] init];
            break;
    }
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView setupSubviews];
    [self.scrollView addSubview:self.contentView];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [self.contentView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:15.0],
                                              [self.contentView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:15.0],
                                              [self.contentView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:15.0],
                                              [self.contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-30.0]
                                              ]];
    
    [NSLayoutConstraint activateConstraints:@[[self.detailsLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:15],
                                              [self.detailsLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-15],
                                              [self.detailsLabel.topAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:20],
                                              [self.detailsLabel.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-20]
                                              ]];
}

- (void)playButtonTapped:(id)sender {
    [self.contentView.playerView setHidden:NO];
    [sender setHidden:YES];
    [self.player play];
}

- (void)activityButtonTapped:(id)sender {
    if (self.detailItem.isSaved) {
        [DataManager removeItemFromOffline:self.detailItem];
        [self.contentView.activityButton setImage:[UIImage imageNamed:@"download_button"] forState:UIControlStateNormal];
    } else {
        
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.center = self.contentView.activityButton.center;
        [activityIndicator setHidesWhenStopped:YES];
        [self.contentView addSubview:activityIndicator];
        [self.contentView.progressView setHidden:NO];
        
        [DataManager saveItemForOffline:self.detailItem progressView:self.contentView.progressView withCompletionHandler:^{
            [activityIndicator stopAnimating];
            [self.contentView.activityButton setHidden:NO];
            [self.contentView.progressView setHidden:YES];
        }];
        
        [activityIndicator startAnimating];
        [self.contentView.activityButton setHidden:YES];
        [self.contentView.activityButton setImage:[UIImage imageNamed:@"delete_button"] forState:UIControlStateNormal];
    }
}

@end
