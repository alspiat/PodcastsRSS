//
//  CoreDataService.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/30/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "CoreDataService.h"
#import "AppDelegate.h"
#import "Item.h"
#import "ItemMO.h"

@implementation CoreDataService

- (AppDelegate *)appDelegate {
    return ((AppDelegate *)UIApplication.sharedApplication.delegate);
}

- (NSArray<Item *> *)getAllItems {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:ItemMOEntityName];
    
    NSArray<ItemMO *> *itemMOArray = [self.appDelegate.context executeFetchRequest:fetchRequest error:nil];
    
    NSMutableArray<Item *> *items = [[NSMutableArray alloc] init];
    
    for (ItemMO *itemMO in itemMOArray) {
        Item *item = [[Item alloc] initWithManagedObject:itemMO];
        [items addObject:item];
    }
    
    return items;
}

- (void)addItem:(Item *)item {
    ItemMO *itemMO = [[ItemMO alloc] initWithItem:item context:self.appDelegate.context];
    [self.appDelegate.context insertObject:itemMO];
    
    NSLog(@"LOCAL LINK WHEN SAVE: %@", item.mediaContent.localLink);
    NSLog(@"LOCAL LINK WHEN SAVE MO: %@", itemMO.mediaContent.localLink);
    
    [self.appDelegate saveContext];
}

- (BOOL)itemExistsWithGUID:(NSString *)guid {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:ItemMOEntityName];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"guid == %@", guid];
    NSArray<ItemMO *> *itemMOArray = [self.appDelegate.context executeFetchRequest:fetchRequest error:nil];
    
    if (itemMOArray.count > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (Item *)getItemWithGUID:(NSString *)guid {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:ItemMOEntityName];
    
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"guid == %@", guid];
    ItemMO *itemMO = [self.appDelegate.context executeFetchRequest:fetchRequest error:nil].firstObject;

    Item *item = [[Item alloc] initWithManagedObject:itemMO];
    
    return item;
}

- (void)deleteItem:(Item *)item {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:ItemMOEntityName];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"guid == %@", item.guid];
    
    NSArray<ItemMO *> *itemMOArray = [self.appDelegate.context executeFetchRequest:fetchRequest error:nil];
    
    if (!itemMOArray.firstObject) {
        return;
    }
    
    [self.appDelegate.context deleteObject:itemMOArray.firstObject];
    [self.appDelegate saveContext];
}

@end
