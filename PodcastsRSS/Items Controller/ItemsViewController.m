//
//  ItemsViewController.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ItemsViewController.h"

//
//  ViewController.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemServiceRSS.h"
#import "Item.h"
#import "VideoCollectionViewCell.h"
#import "AudioCollectionViewCell.h"
#import "FirstCollectionViewCell.h"
#import "ItemsViewController+CollectionView.h"

@interface ItemsViewController ()

@property (strong, nonatomic) UISwitch *offlineModeSwitch;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Podcasts";
    
    _offlineModeSwitch = [[UISwitch alloc] init];
    [self.offlineModeSwitch addTarget:self action:@selector(offlineModeSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: self.offlineModeSwitch];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _itemsDatasource = [[NSMutableArray alloc] init];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.collectionView];
    [NSLayoutConstraint activateConstraints:@[[self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor],
                                              [self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
                                              [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]]];
    
    [self.collectionView registerClass:VideoCollectionViewCell.class forCellWithReuseIdentifier:videoItemCellIdentifier];
    [self.collectionView registerClass:AudioCollectionViewCell.class forCellWithReuseIdentifier:audioItemCellIdentifier];
    [self.collectionView registerClass:FirstCollectionViewCell.class forCellWithReuseIdentifier:firstItemCellIdentifier];
    
    ItemServiceRSS *itemService = [[ItemServiceRSS alloc] init];
    
    [itemService fetchTedtalksItemsWithCompletionHandler:^(NSArray<Item *> *items) {
        [self.itemsDatasource addObjectsFromArray:items];
        [self.collectionView reloadData];
    }];
    
    [itemService fetchSimplecastItemsWithCompletionHandler:^(NSArray<Item *> *items) {
        [self.itemsDatasource addObjectsFromArray:items];
        [self.collectionView reloadData];
    }];

}

- (void)offlineModeSwitchChanged:(id)sender {
    NSLog(@"Changed mode");
}

- (void)viewWillLayoutSubviews {
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
