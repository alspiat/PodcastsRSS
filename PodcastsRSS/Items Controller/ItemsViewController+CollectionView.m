//
//  ItemsViewController+CollectionView.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/25/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemsViewController+CollectionView.h"
#import "VideoCollectionViewCell.h"
#import "AudioCollectionViewCell.h"
#import "FirstCollectionViewCell.h"
#import "Item.h"

@implementation ItemsViewController (CollectionView)

// MARK: - CollectionView dataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemsDatasource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell<ItemCollectionViewCellProtocol> *cell = nil;
    
    if (indexPath.row == 0) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:firstItemCellIdentifier forIndexPath:indexPath];
    } else if (self.itemsDatasource[indexPath.row].type == ItemTypeTedtalks) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:videoItemCellIdentifier forIndexPath:indexPath];
    } else {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:audioItemCellIdentifier forIndexPath:indexPath];
    }
    
    [cell configureWithItem:self.itemsDatasource[indexPath.row]];
    return cell;
}

// MARK: - CollectionView delegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

// MARK: - CollectionView flowLayout delegate methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size;
    if (indexPath.row == 0) {
        size = CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size.width * 0.6);
    } else {
        size = CGSizeMake(collectionView.bounds.size.width, 90.0);
    }

    return size;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

@end
