//
//  DeviceInterface.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthTask.h"
#import "DfthBlocks.h"
#import "DfthDeviceStateDelegate.h"

@protocol DeviceInterface <NSObject>
- (void)destory;
- (void)appendStateDelegate:(id<DfthDeviceStateDelegate>)delegate;
- (void)removeStateDelegate:(id<DfthDeviceStateDelegate>)delegate;
- (DfthTask *)getConnectTaskWithCompleteHandler:(SimpleBlock)handler;
- (DfthTask *)getDisconnectTaskWithCompleteHandler:(SimpleBlock)handler;
- (DfthTask *)getStartMeasureTaskWithCompleteHandler:(SimpleBlock)handler;
- (DfthTask *)getStopMeasureTaskWithCompleteHandler:(SimpleBlock)handler;
@end
