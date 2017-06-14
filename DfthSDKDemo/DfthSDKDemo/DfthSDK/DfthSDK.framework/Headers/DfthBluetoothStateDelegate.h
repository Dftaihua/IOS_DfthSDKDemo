//
//  DfthBluetoothStateDelegate.h
//  DfthSDK
//
//  Created by yue gao on 2017/4/26.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DfthBluetoothStateDelegate <NSObject>

/**
 * 蓝牙开启
 *
 */
- (void)bluetoothAdapterOn;

/**
 * 蓝牙关闭
 *
 */
- (void)bluetoothAdapterOff;
@end
