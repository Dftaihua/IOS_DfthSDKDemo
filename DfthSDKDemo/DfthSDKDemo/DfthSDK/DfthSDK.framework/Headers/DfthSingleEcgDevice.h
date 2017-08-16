//
//  DfthSingleEcgDevice.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "DfthDevice.h"
#import "DfthSingleEcgDelegate.h"

#define ECG_MEASURE_FOREVEVER 0

typedef NS_ENUM(NSUInteger, EcgMeasureMode) {
    ECGMM_None = 0,
    ECGMM_Manual,
    ECGMM_Plan,
    ECGMM_Trial,
};

@interface DfthSingleEcgDevice : DfthDevice
@property (nonatomic, assign) double sampling;
@property (nonatomic, assign) double ADUnit;
@property (nonatomic, assign) int leadCount;
@property (nonatomic, assign) int leadOutFlag;
@property (nonatomic, assign) EcgMeasureMode measureMode;
@property (nonatomic, assign) int64_t measureLength;    //单位秒
@property (nonatomic, weak) id<DfthSingleEcgDelegate> dataDelegate;

@end
