//
//  XMLParser.m
//  PodcastsRSS
//
//  Created by Aliaksei Piatyha on 7/23/18.
//  Copyright © 2018 Aliaksei Piatyha. All rights reserved.
//

#import "XMLParser.h"

static NSString * const valueKey = @"value";
static NSString * const emtyString = @"";
static NSString * const newLineSymbol = @"\n";
static NSString * const doubleSpaceSymbol = @"  ";
static NSString * const doubleDashSymbol = @"--";
static NSString * const dashSymbol = @"-";

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

- (instancetype)initWithURL:(NSURL *)url forItem:(NSString *)item
{
    self = [super init];
    if (self) {
        _xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        self.xmlParser.delegate = self;
        self.item = item;
    }
    return self;
}

- (NSArray *) parseTags:(NSArray *)searchTags {
    self.searchTags = searchTags;
    [self.xmlParser parse];
    
    return self.resultsArray;
}

// MARK: - NSXMLParser delegate methods

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.resultsArray = [[NSMutableArray alloc] init];
    self.foundValue = [[NSMutableString alloc] init];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"%@", [parseError localizedDescription]);
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
        
        if (self.itemDict[elementName] != nil && ![self.foundValue isEqualToString:emtyString]) {
            [self.itemDict[elementName] setObject:[NSString stringWithString:self.foundValue] forKey:valueKey];
        } else if (self.itemDict[elementName] == nil) {
            self.itemDict[elementName] = [NSString stringWithString:self.foundValue];
        }
    }
    
    [self.foundValue setString:emtyString];
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([self.searchTags containsObject:self.currentElement]) {
        string = [string stringByReplacingOccurrencesOfString:newLineSymbol withString:emtyString];
        string = [string stringByReplacingOccurrencesOfString:doubleSpaceSymbol withString:emtyString];
        string = [string stringByReplacingOccurrencesOfString:doubleDashSymbol withString:dashSymbol];
        
        [self.foundValue appendString:string];
    }
    
}

@end
