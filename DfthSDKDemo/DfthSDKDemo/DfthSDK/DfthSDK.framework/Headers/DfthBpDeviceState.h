//
//  DfthBpDeviceState.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/6.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DfthBpDeviceState : NSObject
@property(nonatomic, assign) int64_t currentPlanCreateTime;
@property(nonatomic, assign) int64_t nextRunCountDown;
@property(nonatomic, assign) int totalCount;
@property(nonatomic, assign) int currentCount;
@end
