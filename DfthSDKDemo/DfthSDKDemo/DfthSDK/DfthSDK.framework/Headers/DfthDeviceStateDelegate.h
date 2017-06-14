//
//  DfthDeviceStateDelegate.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DfthDeviceStateDelegate <NSObject>

/**
 * 设备状态变化的回调
 *
 * @param isConnected 是否连接， true连接状态， false未连接状态
 * @param isMeasuring 是否正在测量， true测量中，false未测量
 */
- (void)connectState:(BOOL)isConnected measureState:(BOOL)isMeasuring;

@end
