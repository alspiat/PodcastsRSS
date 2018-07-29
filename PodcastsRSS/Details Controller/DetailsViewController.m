//
//  DetailsViewController.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "DetailsViewController.h"
#import "ContentView.h"
#import "Item.h"
#import "DataManager.h"
#import "DateFormatter.h"

@interface DetailsViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *detailsLabel;
@property (strong, nonatomic) ContentView *contentView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.scrollView];
    
    _contentView = [[ContentView alloc] init];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.contentView];
    [self.contentView setupSubviews];
    
    _detailsLabel = [[UILabel alloc] init];
    self.detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailsLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightThin];
    self.detailsLabel.numberOfLines = 0;
    [self.detailsLabel sizeToFit];
    [self.scrollView addSubview:self.detailsLabel];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                              [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                              [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
                                              
                                              [self.contentView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [self.contentView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
                                              [self.contentView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                              [self.contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
                                              
                                              [self.detailsLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:15],
                                              [self.detailsLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-15],
                                              [self.detailsLabel.topAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:20],
                                              [self.detailsLabel.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-20]
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
    if (self.detailItem) {
        
        self.contentView.imageView.image = [UIImage imageNamed:@"video"];
        [DataManager getImage:self.detailItem completionHandler:^(UIImage *image) {
            self.contentView.imageView.image = image;
        }];
        
        self.contentView.authorLabel.text = [NSString stringWithFormat:@"%@ | %@", self.detailItem.author, [DateFormatter getStringFromDate:self.detailItem.pubDate withFormat:@"E, d MMM yyyy"]];
        self.contentView.titleLabel.text = self.detailItem.title;
        self.contentView.durationLabel.text = self.detailItem.duration;
        self.detailsLabel.text = self.detailItem.details;
    }
}

@end
