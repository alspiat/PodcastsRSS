//
//  VideoCollectionViewCell.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/24/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemCollectionViewCellProtocol.h"

extern NSString * const videoItemCellIdentifier;

@class Item;

@interface VideoCollectionViewCell : UICollectionViewCell <ItemCollectionViewCellProtocol>

@end
