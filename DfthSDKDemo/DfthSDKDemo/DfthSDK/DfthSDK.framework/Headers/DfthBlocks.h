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
#import "DfthDeviceConstants.h"
#import "DfthUser.h"
//#import "DfthPersonInfo.h"
#import "DfthPackage.h"


@class DfthDevice;
@class DfthBpData;
@class DfthEcgRecord;
@class Response_MemberInfo;

@class Response_FriendsList;
@class Response_DeviceInfo;
@class Response_DeviceList;
@class Response_DeviceBinding;
@class Response_DeviceUnBind;

@class Disease;
@class Habit;
 
typedef void(^EcgSizesBlock)(DfthResult * _Nonnull result,NSInteger totleSize);

typedef void(^SimpleBlock)(DfthResult * _Nonnull result);

typedef void(^RegistBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull userId);
typedef void(^LoginBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull userId);
typedef void(^RegistMemberBlock)(DfthResult * _Nonnull result, DfthUser  * _Nonnull user);

typedef void(^GetDeviceHandler)(DfthResult * _Nonnull result, __kindof DfthDevice * _Nullable device);

typedef void(^DeviceVersionBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull version);

typedef void(^BpVoiceBlock)(DfthResult * _Nonnull result, BpVoiceState state);
typedef void(^BpStateBlock)(DfthResult * _Nonnull result, DfthBpDeviceState * _Nullable state);
typedef void(^BpPlanBlock)(DfthResult *_Nonnull result, DfthBpPlan * _Nullable plan);
//typedef void(^PrepareBlock)(DfthResult *_Nonnull result, DfthBpDeviceState * _Nullable state);

typedef void(^MemberInfoBlock)(DfthResult *_Nonnull result, DfthUser * _Nullable user);


typedef void(^DeviceInfoBlock)(DfthResult *_Nonnull result, Response_DeviceInfo * _Nullable deviceInfo);

typedef void(^DeviceListBlock)(DfthResult *_Nonnull result, NSMutableArray<Response_DeviceList *> * _Nullable deviceInfo);
typedef void(^DeviceBindBlock)(DfthResult *_Nonnull result, Response_DeviceBinding * _Nullable deviceInfo);
typedef void(^DeviceUnBindBlock)(DfthResult *_Nonnull result, Response_DeviceUnBind * _Nullable deviceInfo);
// 我的亲友部分
typedef void(^FriendsListBlock)(DfthResult *_Nonnull result, Response_FriendsList * _Nullable friendsList);


typedef void(^CreateBpRecordBlock)(DfthResult *_Nonnull result, DfthBpData * _Nullable data);


typedef void(^EcgGetMeasureHistory)(DfthResult *_Nonnull result, BOOL isLastPage, NSArray<DfthEcgRecord*> * _Nullable recordArray);
typedef void(^ProgressBlock)(NSProgress *_Nonnull progress);
typedef void (^ProgressWithFileSizeBlock)(int64_t progress);
typedef void(^EcgRecordBlock)(DfthResult *_Nonnull result, DfthEcgRecord * _Nullable record);
typedef void(^EcgDownloadFileBlock)(DfthResult *_Nonnull result, NSString * _Nullable filePath);


typedef void(^DiseaseListBlock)(DfthResult *_Nonnull result, NSArray<Disease *> * _Nullable diseases);
typedef void(^HabitListBlock)(DfthResult *_Nonnull result, NSArray<Habit *> * _Nullable habits);

typedef void(^UploadAllBpData)(DfthResult *_Nonnull result, NSArray<DfthBpData *> * _Nullable datas);
typedef void(^UploadAllBpPlan)(DfthResult *_Nonnull result, NSArray<DfthBpPlan *> * _Nullable plans);
typedef void(^UploadBpPlan)(DfthResult *_Nonnull result, DfthBpPlan * _Nullable plan);


#pragma mark 费用相关
typedef void(^PackagesBlock)(DfthResult *_Nonnull result, NSArray<DfthPackage *> * _Nullable packages);

#endif /* DfthBlocks_h */
