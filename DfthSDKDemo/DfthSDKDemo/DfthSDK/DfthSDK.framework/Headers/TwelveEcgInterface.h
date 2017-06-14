//
//  TwelveEcgInterface.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TwelveEcgInterface <NSObject>

/**
 *	停止SSC任务
 *
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
- (DfthTask *)getStopSSCTaskWithCompleteHandler:(SimpleBlock)handler;


/**
 *	用户设置测量时刻的身体症状
 *
 * @param symptoms 症状列表
 * @param lastTime 症状持续时间
 *
 */
- (void)setBodySymptom:(NSArray<NSNumber*> *)symptoms andLastTime:(int64_t)lastTime;
@end
