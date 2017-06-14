//
//  DfthNetConfig.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DfthNetConfig : NSObject
@property(nonatomic, strong) NSString *baseUrl;
@property(nonatomic, strong) NSString *accessToken;
@property (nonatomic, assign) int timeout;
@property(nonatomic, assign, getter=isDebug) BOOL debug;
@end
