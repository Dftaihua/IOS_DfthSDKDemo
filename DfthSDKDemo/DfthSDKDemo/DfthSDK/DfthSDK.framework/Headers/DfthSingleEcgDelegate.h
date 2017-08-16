//
//  DfthSingleEcgDelegate.h
//  MyBluetooth
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol  DfthSingleEcgDelegate<NSObject>

/**
 * 处理心电数据
 * @param data 心电数据
 *      (15)                        (8)                    (0)
 loff:   X  X  X  X    X  X  X  X    X  X  X  X    X  X  X  X
 导联：   V6 V5 V4 V3   V2       V1                   肢体肢体肢体
 * @param leadOutFlag 导连脱落标志, 0x00000000，代表无导连脱落
 * @param heartRate 当前心率
 * @param isEmpty 数据是否是测量中设备断开时填充的假数据
 */
- (void)handleEcgData:(NSArray *)data leadOutFlag:(int)leadOutFlag heartRate:(int)heartRate isEmptyData:(BOOL)isEmpty;


/**
 * 心电测量结束
 *
 */
- (void)onMeasureStopped;


/**
 * 心电测量结果
 *
 * @param ecgRecord 心电测量结果
 */
- (void)handleMeasureResult:(DfthEcgRecord *)ecgRecord;


@end
