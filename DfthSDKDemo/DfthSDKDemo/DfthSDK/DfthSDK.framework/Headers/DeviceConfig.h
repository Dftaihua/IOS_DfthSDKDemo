//
//  DeviceConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface DeviceConfig : BaseArchiveObject
@property(nonatomic, strong) NSArray<NSNumber*> *disconnectReconnectDeviceTimes;//断开蓝牙设备重连时间组
//public List<Device> devices;//设备配对密码表
@property(nonatomic, assign) BOOL supportPrinter;//是否支持打印
@end
