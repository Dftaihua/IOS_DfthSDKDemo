//
//  DfthBpDeviceDelegate.h
//  MyBluetooth
//
//  Created by admin on 2016/12/2.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthBpPlan.h"
#import "DfthBpDeviceState.h"
#import "DfthBpData.h"

@protocol  DfthBpDeviceDelegate<NSObject>
/**
 * 处理血压数据
 *
 * @param pressure 当前压力值
 */
- (void)handleCurrentPressure:(int)pressure; // 压力值
- (void)bpMeasureResult:(DfthBpData *)results;
- (void)bpPlanMeasureFailed;
#if 0
- (void)measureWillStartInTwoMinutesLater;
- (void)lowBatteryWarning;
#endif
//- (void)deviceSleeped;
//- (void)deviceStateArrived:(DfthBpDeviceState *)state;
//- (void)devicePlanArrived:(DfthBpPlan *)plan;
@end
