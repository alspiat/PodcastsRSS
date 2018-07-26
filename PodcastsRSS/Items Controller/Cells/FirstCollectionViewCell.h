//
//  FirstCollectionViewCell.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/26/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCollectionViewCellProtocol.h"

extern NSString * const firstItemCellIdentifier;

@class Item;

@interface FirstCollectionViewCell : UICollectionViewCell <ItemCollectionViewCellProtocol>

@end
