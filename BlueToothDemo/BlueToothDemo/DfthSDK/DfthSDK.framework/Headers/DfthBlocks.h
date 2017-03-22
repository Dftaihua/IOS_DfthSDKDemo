//
//  DfthBlocks.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#ifndef DFTHBLOCKS_h
#define DFTHBLOCKS_h

#import "DfthResult.h"
#import "DfthBpDeviceState.h"
#import "DfthBpPlan.h"
//#import "DfthTwelveEcgDevice.h"
//#import "DfthBpDevice.h"
#import "DfthDeviceConstants.h"
#import "DfthUser.h"
#import "DfthPersonInfo.h"

//@class DfthUser;
@class DfthSingleEcgDevice;
@class DfthTwelveEcgDevice;
@class DfthBpDevice;


typedef void(^SimpleBlock)(DfthResult * _Nonnull result);

typedef void(^RegistBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull userId);
typedef void(^LoginBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull userId);
//typedef void(^RegistMemberBlock)(DfthResult * _Nonnull result, DfthUser  * _Nonnull user);

typedef void(^GetSingleEcgDeviceHandler)(DfthResult * _Nonnull result, DfthSingleEcgDevice * _Nullable device);
typedef void(^GetTwelveEcgDeviceHandler)(DfthResult * _Nonnull result, DfthTwelveEcgDevice * _Nullable device);
typedef void(^GetBpDeviceHandler)(DfthResult * _Nonnull result, DfthBpDevice * _Nullable device);

typedef void(^BpVoiceBlock)(DfthResult * _Nonnull result, BpVoiceState state);
typedef void(^BpStateBlock)(DfthResult * _Nonnull result, DfthBpDeviceState * _Nullable state);
typedef void(^BpPlanBlock)(DfthResult *_Nonnull result, DfthBpPlan * _Nullable plan);
//typedef void(^PrepareBlock)(DfthResult *_Nonnull result, DfthBpDeviceState * _Nullable state);

typedef void(^PersonInfoBlock)(DfthResult *_Nonnull result, DfthPersonInfo * _Nullable personInfo);
#endif /* DfthBlocks_h */
