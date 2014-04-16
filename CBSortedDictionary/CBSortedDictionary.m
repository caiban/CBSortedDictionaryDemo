//
//  CBSortedDictionary.m
//  CBSortedDictionaryDemo
//
//  Created by z on 14-4-14.
//  Copyright (c) 2014年 z. All rights reserved.
//

#import "CBSortedDictionary.h"

@interface CBSortedDictionary ()

@property (nonatomic, strong) NSMutableDictionary *normalDictionary;

@end

@implementation CBSortedDictionary
@synthesize sortedKeys;
@synthesize normalDictionary;

- (NSString *)description
{
    NSMutableString *result = [NSMutableString string];
    [result appendString:@"{\n"];
    for (id key in self.sortedKeys) {
        [result appendString:[self descriptionWithKey:key]];
    }
    [result appendString:@"}"];
    
    return result;
}

- (NSString *)descriptionWithKey:(id)key
{
    NSMutableString *result = [NSMutableString string];
    [result appendString:@"\t"];
    [result appendString:[key description]];
    [result appendString:@" = "];
    [result appendString:[[self.normalDictionary objectForKey:key] description]];
    [result appendString:@";\n"];
    return result;
}

+ (CBSortedDictionary *)dictionaryWithCapacity:(NSUInteger)numItems
{
    CBSortedDictionary *result = [[CBSortedDictionary alloc] initWithCapacity:numItems];
    return result;
}

- (id)init
{
    self = [super init];
    if (self) {
        sortedKeys = [NSMutableArray array];
        normalDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    if (self) {
        sortedKeys = [NSMutableArray arrayWithCapacity:numItems];
        normalDictionary = [NSMutableDictionary dictionaryWithCapacity:numItems];
    }
    return self;
}

- (id)objectForKey:(id<NSCopying>)key
{
    return [self.normalDictionary objectForKey:key];
}

- (id)lastKey
{
    return self.sortedKeys.lastObject;
}

- (id)firstKey
{
    if (nil == self.sortedKeys || self.sortedKeys.count == 0) {
        return nil;
    }
    
    return [self.sortedKeys objectAtIndex:0];
}

- (CBSortedDictionary *)sub:(id<NSCopying>)start to:(id<NSCopying>)end
{
    NSInteger location = [self.sortedKeys indexOfObject:start];
    if (location == NSNotFound) {
        return nil;
    }
    NSInteger endLocation = [self.sortedKeys indexOfObject:end];
    if (endLocation == NSNotFound) {
        endLocation = self.sortedKeys.count - 1;
    }
    
    NSInteger length = endLocation - location;
    if (length < 0) {
        return nil;
    }
    
    NSRange range = NSMakeRange(location, length + 1);
    
    NSArray *subArray = [self.sortedKeys subarrayWithRange:range];
//    NSLog(@"sub to subArray = %@", subArray);
    
    CBSortedDictionary *subDictionary = [CBSortedDictionary dictionaryWithCapacity:subArray.count];
    for (id<NSCopying> key in subArray) {
        id object = [self objectForKey:key];
        if (nil == object) {
            continue;
        }
        [subDictionary.normalDictionary setObject:object forKey:key];
    }
    
    [subDictionary.sortedKeys addObjectsFromArray:subArray];
    
    return subDictionary;
}

- (void)removeObjectForKey:(id)aKey
{
    [self.normalDictionary removeObjectForKey:aKey];
    [self.sortedKeys removeObject:aKey];
}

- (void)removeObjectStart:(id)start end:(id)end
{
    NSInteger location = [self.sortedKeys indexOfObject:start];
    if (location == NSNotFound) {
        return;
    }
    NSInteger endLocation = [self.sortedKeys indexOfObject:end];
    if (endLocation == NSNotFound) {
        endLocation = self.sortedKeys.count - 1;
    }
    
    NSInteger length = endLocation - location;
    if (length < 0) {
        return;
    }
    
    NSRange range = NSMakeRange(location, length + 1);
    
    NSArray *subArray = [self.sortedKeys subarrayWithRange:range];
    
    [self removeObjectsForKeys:subArray];
}

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
    [self.normalDictionary removeObjectsForKeys:keyArray];
    [self.sortedKeys removeObjectsInArray:keyArray];
}

- (void)removeAllObject
{
    [self.sortedKeys removeAllObjects];
    [self.normalDictionary removeAllObjects];
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [self addKey:aKey];
    [self.normalDictionary setObject:anObject forKey:aKey];
}

- (void)addKey:(id<NSCopying>)aKey
{
    if ([self.sortedKeys containsObject:aKey]) {
        return;
    }
    [self.sortedKeys addObject:aKey];
    [self.sortedKeys sortUsingSelector:@selector(compare:)];
}

@end
