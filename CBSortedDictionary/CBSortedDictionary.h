//
//  CBSortedDictionary.h
//  CBSortedDictionaryDemo
//
//  Created by z on 14-4-14.
//  Copyright (c) 2014年 z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBSortedDictionary : NSObject

+ (CBSortedDictionary *)dictionaryWithCapacity:(NSUInteger)numItems;
- (id)lastKey;
- (id)firstKey;
- (void)removeObjectsForKeys:(NSArray *)keyArray;
- (void)removeObjectForKey:(id)aKey;
- (void)removeObjectStart:(id)start end:(id)end;
- (void)removeAllObject;
- (id)objectForKey:(id<NSCopying>)key;
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (CBSortedDictionary *)sub:(id<NSCopying>)start to:(id<NSCopying>)end;

@property (nonatomic, strong) NSMutableArray *sortedKeys;
@end
