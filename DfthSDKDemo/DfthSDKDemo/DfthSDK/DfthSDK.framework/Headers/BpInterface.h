//
//  BpInterface.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BpInterface <NSObject>

/**
 *	查询设备语音状态
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getQueryVoiceStatusTaskWithCompleteHandler:(BpVoiceBlock)handler;

/**
 *	打开设备语音
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getOpenVoiceTaskWithCompleteHandler:(SimpleBlock)handler;

/**
 *	关闭设备语音
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getCloseVoiceTaskWithCompleteHandler:(SimpleBlock)handler;

/**
 *	查询设备状态
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getQueryDeviceStatusTaskWithCompleteHanlder:(BpStateBlock)handler;

/**
 *	查询设备中的测量计划
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getQueryDevicePlanTaskWithCompleteHanlder:(BpPlanBlock)handler;

/**
 *	清除设备中的测量计划
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getClearPlanTaskWithCompleteHanlder:(SimpleBlock)handler;

/**
 *	下发测量计划
 *
 * @param dayInterval 日间测量间隔时间，单位分钟
 * @param nightInterval 夜间测量时间间隔，单位分钟
 * @param alarmTime 测量前提醒时间，单位分钟
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getMakePlanTaskWithDayInterval:(int)dayInterval nightInterval:(int)nightInterval alarmTime:(int)alarmTime completeHandler:(SimpleBlock)handler;

@end
