//
//  XMLParser.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "XMLParser.h"
#import "ItemFilterConstants.h"

static NSString * const valueKey = @"value";

@interface XMLParser() <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser *xmlParser;

@property (nonatomic, strong) NSMutableArray *resultsArray;
@property (nonatomic, strong) NSMutableDictionary *itemDict;
@property (nonatomic, strong) NSMutableString *foundValue;
@property (nonatomic, strong) NSString *currentElement;

@property (nonatomic, strong) NSString *item;
@property (nonatomic, strong) NSArray *searchTags;

@end


@implementation XMLParser

- (NSArray *)startParsingURL:(NSURL *)url withItem:(NSString *)item tags:(NSArray *)searchTags {
    self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    self.xmlParser.delegate = self;
    
    self.item = item;
    self.searchTags = searchTags;
    [self.xmlParser parse];
    
    return self.resultsArray;
}

// MARK: - NSXMLParser delegate methods

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.resultsArray = [[NSMutableArray alloc] init];
    self.foundValue = [[NSMutableString alloc] init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:self.item]) {
        self.itemDict = [[NSMutableDictionary alloc] init];
    } else if ([self.searchTags containsObject:elementName] && self.itemDict != nil) {
        self.itemDict[elementName] = attributeDict.count != 0 ? [NSMutableDictionary dictionaryWithDictionary:attributeDict] : nil;
    }
    
    self.currentElement = elementName;
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:self.item]) {
        [self.resultsArray addObject:self.itemDict];
    } else if ([self.searchTags containsObject:elementName] && self.itemDict != nil) {
        
        if (self.itemDict[elementName] != nil && ![self.foundValue isEqualToString:emptyString]) {
            [self.itemDict[elementName] setObject:[NSString stringWithString:self.foundValue] forKey:valueKey];
        } else if (self.itemDict[elementName] == nil) {
            self.itemDict[elementName] = [NSString stringWithString:self.foundValue];
        }
    }
    
    [self.foundValue setString:emptyString];
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([self.searchTags containsObject:self.currentElement]) {
        [self.foundValue appendString:string];
    }
    
}

@end
