//
//  Request_AmbpsNibps.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_AmbpsNibps : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *planId;

- (instancetype)initWithUserId:(NSString *)userId planId:(NSString *)planId;
@end
