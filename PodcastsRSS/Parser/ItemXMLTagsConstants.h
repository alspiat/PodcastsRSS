//
//  ItemXMLTagsConstants.h
//  PodcastsRSS
//
//  Created by Алексей on 28.07.2018.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#ifndef ItemXMLTagsConstants_h
#define ItemXMLTagsConstants_h

static NSString * const itemTag = @"item";

static NSString * const guidField = @"guid";
static NSString * const titleField = @"title";
static NSString * const authorField = @"itunes:author";
static NSString * const pubDateField = @"pubDate";
static NSString * const durationField = @"itunes:duration";
static NSString * const detailsField = @"itunes:summary";
static NSString * const valueField = @"value";

static NSString * const imageField = @"itunes:image";
static NSString * const imageURLField = @"href";

static NSString * const mediaField = @"enclosure";
static NSString * const mediaURLField = @"url";

#endif /* ItemXMLTagsConstants_h */
