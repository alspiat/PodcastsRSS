//
//  AudioCollectionViewCell.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCollectionViewCellProtocol.h"

extern NSString * const audioItemCellIdentifier;

@class Item;

@interface AudioCollectionViewCell : UICollectionViewCell <ItemCollectionViewCellProtocol>

@end
