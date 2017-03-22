//
//  DfthSingleEcgDelegate.h
//  MyBluetooth
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthEcgRecord.h"

@protocol  DfthSingleEcgDelegate<NSObject>

/**
 * 处理心电数据
 * @param data 心电数据
 * @param leadOutFlag 导连脱落标志, 0x00000000，代表无导连脱落，0x00000001代表v1导连脱落，其他导连以此类推
 * @param heartRate 当前心率
 * @param isEmpty 是否假数据
 */
- (void)handleEcgData:(NSArray *)data leadOutFlag:(int)leadOutFlag heartRate:(int)heartRate isEmptyData:(BOOL)isEmpty;
- (void)handleMeasureResult:(DfthEcgRecord *)ecgRecord;
@end
