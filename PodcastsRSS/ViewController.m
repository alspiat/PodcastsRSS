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

@interface ItemsViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<Item *> *datasource;

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
    
    _datasource = [[NSMutableArray alloc] init];
    
    ItemServiceRSS *itemService = [[ItemServiceRSS alloc] init];
    
    [itemService fetchTedtalksItemsWithCompletionHandler:^(NSArray<Item *> *items) {
        [self.datasource addObjectsFromArray:items];
        [self.tableView reloadData];
        NSLog(@"Ted");
    }];
    
    [itemService fetchSimplecastItemsWithCompletionHandler:^(NSArray<Item *> *items) {
        [self.datasource addObjectsFromArray:items];
        [self.tableView reloadData];
        NSLog(@"Simplecast");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.datasource[indexPath.row].title;
    cell.detailTextLabel.text = self.datasource[indexPath.row].guid;
    
    return cell;
}

@end
