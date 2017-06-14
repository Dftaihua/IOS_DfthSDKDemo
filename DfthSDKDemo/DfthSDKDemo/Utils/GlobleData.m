//
//  GlobleData.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "GlobleData.h"

@implementation GlobleData

+ (instancetype)sharedInstance{
    static GlobleData *data;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[GlobleData alloc] initPrivate];
    });
    
    return data;
}

- (instancetype)init{
    NSAssert(false, @"no no no...");
    return nil;
}

- (instancetype)initPrivate{
    self = [super init];
    if (self) {
        
    }
    return self;
}
@end
