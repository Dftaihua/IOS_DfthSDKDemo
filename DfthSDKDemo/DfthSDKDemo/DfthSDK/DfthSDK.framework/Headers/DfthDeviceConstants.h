
//  DfthDeviceConstants.h
//  MyBluetooth
//
//  Created by admin on 2016/11/14.
//  Copyright © 2016年 admintest. All rights reserved.
//

#ifndef DfthDeviceConstants_h
#define DfthDeviceConstants_h

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, DfthDeviceType) {
    DDT_Unknown = 0,         // 东方泰华未知设备或全部设备
    DDT_SingleEcg,      // 东方泰华单导心电设备
    DDT_TwelveEcg,      // 东方泰华12导心电设备
    DDT_BP,             // 东方泰华动态血压
//    DfthDeviceTypePrint  = 0x01, // 东方泰华蓝牙打印机
};

typedef NS_ENUM(NSInteger, EcgSSCState) {
    SSC_ON = 1,
    SSC_OFF = 0,
};

typedef NS_ENUM(NSInteger, EcgMeasureState) {
    EcgMeasureStop = 0,
    EcgMeasureStart,
};

typedef NS_ENUM(NSInteger, BpVoiceState) {
    VOICE_CLOSED = 1,
    VOICE_OPENED = 0,
};


#endif /* DfthDeviceConstants_h */
