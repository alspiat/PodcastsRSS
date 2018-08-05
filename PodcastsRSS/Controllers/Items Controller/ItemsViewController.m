//
//  ItemsViewController.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ItemsViewController.h"
#import "RssService.h"
#import "Item.h"
#import "VideoCollectionViewCell.h"
#import "AudioCollectionViewCell.h"
#import "FirstCollectionViewCell.h"
#import "ItemsViewController+CollectionView.h"
#import "CoreDataService.h"

#import "DataManager.h"

@interface ItemsViewController ()

@property (strong, nonatomic) NSMutableArray<Item *> *onlineDatasource;
@property (strong, nonatomic) NSMutableArray<Item *> *offlineDatasource;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"Podcasts";

    self.offlineModeSwitch = [[UISwitch alloc] init];
    [self.offlineModeSwitch addTarget:self action:@selector(offlineModeSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: self.offlineModeSwitch];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];

    self.offlineDatasource = [[NSMutableArray alloc] init];
    self.onlineDatasource = [[NSMutableArray alloc] init];

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

    [self updateContent];
}

- (NSMutableArray<Item *> *)itemsDatasource {
    if (self.offlineModeSwitch.isOn) {
        return self.offlineDatasource;
    } else {
        return self.onlineDatasource;
    }
}

- (void)offlineModeSwitchChanged:(id)sender {
    [self updateContent];
}

- (void)updateContent {
    if (self.offlineModeSwitch.isOn) {
        [self.offlineDatasource removeAllObjects];
        
        [DataManager fetchOfflineDataWithCompletionHandler:^(NSArray<Item *> *items) {
            [self.offlineDatasource addObjectsFromArray:items];
            [self.collectionView reloadData];
        }];
        
    } else {
        [self.onlineDatasource removeAllObjects];
        
        [DataManager fetchDataWithCompletionHandler:^(NSArray<Item *> *items) {
            [self.onlineDatasource addObjectsFromArray:items];
            self.onlineDatasource = [[self sortItems:self.onlineDatasource] mutableCopy];
            [self.collectionView reloadData];
        }];
    }
}

- (NSArray<Item *> *)sortItems:(NSArray<Item *> *) items {
    NSArray *sortedArray = [items sortedArrayUsingComparator:^NSComparisonResult(Item *obj1, Item *obj2) {
        return [obj2.pubDate compare:obj1.pubDate];
    }];
    return sortedArray;
}

- (void)viewWillLayoutSubviews {
    [self.collectionView.collectionViewLayout invalidateLayout];
}

@end
