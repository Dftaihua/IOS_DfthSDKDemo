//
//  DfthBpDevice.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/4.
//  Copyright © 2017年 yue gao. All rights reserved.
//
#import "DfthDevice.h"
#import "DfthBpDeviceDelegate.h"
#import "DfthBpPlan.h"
#import "BpInterface.h"
#import "DfthDeviceConstants.h"
#import "DfthBpDeviceState.h"

@interface DfthBpDevice : DfthDevice <BpInterface>
@property (nonatomic, assign) BpVoiceState *voiceState;
@property(nonatomic, strong) id<DfthBpDeviceDelegate> delegate;
@property (nonatomic, strong) DfthBpPlan *userPlan;
@property (nonatomic, strong) DfthBpPlan *devicePlan;
@property (nonatomic, strong) DfthBpDeviceState *deviceState;
@end
