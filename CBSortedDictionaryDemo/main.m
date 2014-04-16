//
//  main.m
//  CBSortedDictionaryDemo
//
//  Created by z on 14-4-14.
//  Copyright (c) 2014年 z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBSortedDictionary.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, CBSortedDictionary!");
        CBSortedDictionary *dic = [CBSortedDictionary dictionaryWithCapacity:20];
        [dic setObject:@"v1" forKey:@1];
        [dic setObject:@"v2" forKey:@2];
        [dic setObject:@"v9" forKey:@9];
        [dic setObject:@"v3" forKey:@3];
        [dic setObject:@"v8" forKey:@8];
        [dic setObject:@"v5" forKey:@5];
        [dic setObject:@"v10" forKey:@10];
        [dic setObject:@"v23" forKey:@23];
        [dic setObject:@"v17" forKey:@17];
        [dic setObject:@"v-8" forKey:@-8];
        NSLog(@"%@", dic);
    }
    return 0;
}

