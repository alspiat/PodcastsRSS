//
//  XMLParser.h
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject

- (NSArray *)startParsingURL:(NSURL *)url withItem:(NSString *)item tags:(NSArray *)searchTags;

@end
