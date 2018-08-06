//
//  SettingsViewController.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 8/6/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "SettingsViewController.h"
#import "Constants.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.title = settingsTitle;
    
    if (@available(iOS 11, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
        
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:closeButtonImageName] style:UIBarButtonItemStyleDone target:self action:@selector(closeButtonTapped:)];
    self.navigationController.navigationBar.tintColor = UIColor.blackColor;
    
    UISwitch *offlineModeSwitch = [[UISwitch alloc] init];
    offlineModeSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [offlineModeSwitch addTarget:self action:@selector(offlineModeSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [offlineModeSwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:userDefaultsOfflineModeKey]];
    [self.view addSubview:offlineModeSwitch];
    
    UILabel *offlineModeLabel = [[UILabel alloc] init];
    offlineModeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [offlineModeLabel setText:@"Offline mode:"];
    [self.view addSubview:offlineModeLabel];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [offlineModeLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20.0],
                                              [offlineModeLabel.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:50.0],
                                              
                                              [offlineModeSwitch.leadingAnchor constraintEqualToAnchor:offlineModeLabel.trailingAnchor constant:15.0],
                                              [offlineModeSwitch.centerYAnchor constraintEqualToAnchor:offlineModeLabel.centerYAnchor]
                                              ]];
}

- (void)offlineModeSwitchChanged:(UISwitch *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:sender.isOn forKey:userDefaultsOfflineModeKey];
}

- (void)closeButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
