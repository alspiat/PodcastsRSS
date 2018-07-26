//
//  XMLParser.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject

- (XMLParser *)initWithURL:(NSURL *)url forItem:(NSString *)item;
- (NSArray *)parseTags:(NSArray *)searchTags;

@end
