//
//  BpInterface.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BpInterface <NSObject>
- (DfthTask *)getQueryVoiceStatusTaskWithCompleteHandler:(BpVoiceBlock)handler;
- (DfthTask *)getOpenVoiceTaskWithCompleteHandler:(SimpleBlock)handler;
- (DfthTask *)getCloseVoiceTaskWithCompleteHandler:(SimpleBlock)handler;
- (DfthTask *)getMakePlanTaskWithDayInterval:(int)dayInterval nightInterval:(int)nightInterval alarmTime:(int)alarmTime completeHandler:(SimpleBlock)handler;

- (DfthTask *)getQueryDeviceStatusTaskWithCompleteHanlder:(BpStateBlock)handler;
- (DfthTask *)getQueryDevicePlanTaskWithCompleteHanlder:(BpPlanBlock)handler;
- (DfthTask *)getClearPlanTaskWithCompleteHanlder:(SimpleBlock)handler;

//- (DfthTask *)getPrepareTaskWithCompleteHandler:(PrepareBlock)handler;
@end
