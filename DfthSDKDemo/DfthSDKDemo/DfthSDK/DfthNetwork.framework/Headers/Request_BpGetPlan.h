//
//  Request_BpGetPlan.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_BpGetPlan : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *planId;

- (instancetype)initWithUserId:(NSString *)userId planId:(NSString *)planId;
@end
