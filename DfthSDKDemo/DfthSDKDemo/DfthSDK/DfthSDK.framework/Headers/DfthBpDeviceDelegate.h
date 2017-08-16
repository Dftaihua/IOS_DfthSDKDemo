//
//  DfthBpDeviceDelegate.h
//  MyBluetooth
//
//  Created by admin on 2016/12/2.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DfthBpDeviceState.h"


@protocol  DfthBpDeviceDelegate<NSObject>
/**
 * 处理血压测量数据
 *
 * @param pressure 当前压力值
 */
- (void)handleCurrentPressure:(int)pressure; // 压力值

/**
 * 处理血压测量结果
 *
 * @param results 血压测量结果
 */
- (void)bpMeasureResult:(DfthBpData *)results;

/**
 * 处理血压测量失败
 *
 */
- (void)bpMeasureFailed;

#if 0
- (void)measureWillStartInTwoMinutesLater;
- (void)lowBatteryWarning;

//- (void)deviceSleeped;
//- (void)deviceStateArrived:(DfthBpDeviceState *)state;
//- (void)devicePlanArrived:(DfthBpPlan *)plan;
#endif
@end
