//
//  ItemCollectionViewCellProtocol.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@protocol ItemCollectionViewCellProtocol <NSObject>

- (void)configureWithItem: (Item*) item;

@end
