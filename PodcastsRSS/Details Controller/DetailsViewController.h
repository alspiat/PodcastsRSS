//
//  DetailsViewController.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Item *detailItem;

@end
