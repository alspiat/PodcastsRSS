//
//  ControllersManager.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/27/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Item;

@interface ControllersManager : NSObject

@property (readonly, strong, nonatomic) UISplitViewController *splitViewController;

+ (ControllersManager *) sharedManager;

- (void) showDetailsViewControllerWithItem: (Item *) item;

@end
