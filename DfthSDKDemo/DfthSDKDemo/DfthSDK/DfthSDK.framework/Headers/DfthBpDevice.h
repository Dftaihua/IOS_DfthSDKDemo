//
//  DfthBpDevice.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/4.
//  Copyright © 2017年 yue gao. All rights reserved.
//
#import "DfthDevice.h"
#import "DfthBpDeviceDelegate.h"
#import "BpInterface.h"
#import "DfthDeviceConstants.h"
#import "DfthBpDeviceState.h"

typedef NS_ENUM(NSInteger, BpMeasureMode) {
    BPMM_Manual = -1,  // 测量类型：手动测量（偶测）
    BPMM_Unkown = 0,  // 测量类型：全部类型
    BPMM_Plan = 1,  //测量类型：自动测量（动态血压计划）
    BPMM_Input = 2, // 测量类型：用户输入
    BPMM_Trial
};

@interface DfthBpDevice : DfthDevice <BpInterface>
@property (nonatomic, assign) BpVoiceState voiceState;
@property (nonatomic, strong) id<DfthBpDeviceDelegate> delegate;
@property (nonatomic, strong) DfthBpPlan *userPlan;
@property (nonatomic, strong) DfthBpPlan *devicePlan;
@property (nonatomic, strong) DfthBpDeviceState *deviceState;
@property (nonatomic, assign) BpMeasureMode measureMode;
@end
