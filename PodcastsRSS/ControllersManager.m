//
//  ControllersManager.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ControllersManager.h"
#import "ItemsViewController.h"
#import "DetailsViewController.h"

static ControllersManager *_sharedManager = nil;

@interface ControllersManager() <UISplitViewControllerDelegate>

@property (readwrite, strong, nonatomic) UISplitViewController *splitViewController;
@property (strong, nonatomic) UINavigationController *detailsNavigationController;
@property (strong, nonatomic) UINavigationController *itemsNavigationController;

@end

@implementation ControllersManager

+ (ControllersManager *)sharedManager {
    if (!_sharedManager) {
        _sharedManager = [[ControllersManager alloc] init];
    }
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        ItemsViewController *itemsViewController = [[ItemsViewController alloc] init];
        DetailsViewController *detailsViewController = [[DetailsViewController alloc] init];
        
        self.itemsNavigationController = [[UINavigationController alloc] initWithRootViewController:itemsViewController];
        self.detailsNavigationController = [[UINavigationController alloc] initWithRootViewController:detailsViewController];
        
        _splitViewController = [[UISplitViewController alloc] init];
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:self.itemsNavigationController, nil];
        self.splitViewController.delegate = self;
        self.splitViewController.view.backgroundColor = UIColor.whiteColor;
        self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
        
        detailsViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        detailsViewController.navigationItem.leftItemsSupplementBackButton = YES;
    }
    return self;
}

- (void)showDetailsViewControllerWithItem:(Item *)item {
    DetailsViewController *detailsViewController = self.detailsNavigationController.viewControllers.firstObject;
    [detailsViewController setDetailItem:item];
    [self.splitViewController showDetailViewController:self.detailsNavigationController sender:nil];
}

// MARK: - UISplitViewController delegate methods

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
}

@end
