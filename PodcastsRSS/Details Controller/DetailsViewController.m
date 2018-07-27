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

@interface DetailsViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = UIColor.greenColor;
    
    [self.view addSubview:self.scrollView];
    [NSLayoutConstraint activateConstraints:@[[self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
                                              [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
                                              [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]]];
    
    // Do any additional setup after loading the view.
}

- (void)setupViews {
    _scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = UIColor.greenColor;
    
    [self.view addSubview:self.scrollView];
    [NSLayoutConstraint activateConstraints:@[[self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
                                              [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                              [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]]];
    
    ContentView *contentView = [[ContentView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    //    imageView.image = [UIImage imageNamed:@"vidos"];
    //    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    //
    //    UILabel *detailsLabel = [[UILabel alloc] init];
    //    detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    //    detailsLabel.text = @"Details details details details details details details details details details details details details details details details details details details details";
    //    detailsLabel.numberOfLines = 0;
    //    [detailsLabel sizeToFit];
    
    UILabel *durationLabel = [[UILabel alloc] init];
    durationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    durationLabel.text = @"00:22:55";
    
    UILabel *pubdDateLabel = [[UILabel alloc] init];
    pubdDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    pubdDateLabel.text = @"15 July 2018";
    
    UILabel *detailsLabel = [[UILabel alloc] init];
    detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    detailsLabel.text = self.detailItem.title;
    detailsLabel.numberOfLines = 0;
    [detailsLabel sizeToFit];
    
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    authorLabel.text = @"Somebody";
    
    [self.scrollView addSubview:contentView];
    [self.scrollView addSubview:detailsLabel];
    
    //[self.scrollView addSubview:durationLabel];
    //[self.scrollView addSubview:pubdDateLabel];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [contentView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [contentView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
                                              [contentView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                              [contentView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
                                              
                                              [detailsLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:10],
                                              [detailsLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-10],
                                              [detailsLabel.topAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:20],
                                              [detailsLabel.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-20]
                                              ]];
    
    [contentView setupSubviews];
    self.view.backgroundColor = UIColor.redColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(Item *)detailItem {
    _detailItem = detailItem;
    
    UILabel *detailsLabel = [[UILabel alloc] init];
    detailsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    detailsLabel.text = self.detailItem.title;
    detailsLabel.numberOfLines = 0;
    [detailsLabel sizeToFit];
    
    [self.scrollView addSubview:detailsLabel];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [detailsLabel.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:10],
                                              [detailsLabel.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-10],
                                              [detailsLabel.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:20]
                                              ]];
    
    //[self setupViews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
