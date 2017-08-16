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

/**
 *	释放设备
 */
- (void)destory;

/**
 *	添加设备状态变化的监听
 *
 * @param delegate 代理
 */
- (void)appendStateDelegate:(id<DfthDeviceStateDelegate>)delegate;

/**
 *	移除设备状态变化的监听
 *
 * @param delegate 代理
 */
- (void)removeStateDelegate:(id<DfthDeviceStateDelegate>)delegate;

/**
 *	获取连接设备的任务
 *
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getConnectTaskWithCompleteHandler:(SimpleBlock)handler;

/**
 *	获取断开连接的任务
 *
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getDisconnectTaskWithCompleteHandler:(SimpleBlock)handler;

/**
 *	获取开始测量的任务
 *
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getStartMeasureTaskWithCompleteHandler:(StartMeasureBlock)handler;

/**
 *	获取开始定时测量的任务
 *
 * @param measureLength 指定测量的时长，单位秒
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getStartMeasureTaskWithMeasureLength:(int64_t)measureLength CompleteHandler:(StartMeasureBlock)handler;

/**
 *	获取开始体验测量的任务
 *
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getStartTrialMeasureTaskWithCompleteHandler:(StartMeasureBlock)handler;

/**
 *	获取停止测量的任务
 *
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getStopMeasureTaskWithCompleteHandler:(SimpleBlock)handler;

/**
 *	获取设备版本号的任务
 *
 * @param handler 任务执行完毕的回调
 *
 * @return 任务实例
 */
- (DfthTask *)getDeviceVersionTaskWithCompleteHandler:(DeviceVersionBlock)handler;
@end
