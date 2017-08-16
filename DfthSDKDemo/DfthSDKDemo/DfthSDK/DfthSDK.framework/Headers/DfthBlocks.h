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

#import "DfthDeviceConstants.h"

//#import "DfthPersonInfo.h"
#import "DfthPackage.h"


@class DfthDevice;
@class DfthBpData;
@class DfthEcgRecord;
@class DfthUser;
@class DfthBpPlan;
@class Response_MemberInfo;

@class Response_FriendsCount;
@class Response_getMember;
@class Response_FindFriends;
@class Response_FindApplyList;

@class Response_DeviceInfo;
@class Response_DeviceList;
@class Response_DeviceBinding;
@class Response_DeviceUnBind;
@class Response_UserDeviceList;

@class Disease;
@class Habit;
 
typedef void(^EcgSizesBlock)(DfthResult * _Nonnull result,NSInteger totleSize);

typedef void(^SimpleBlock)(DfthResult * _Nonnull result);
typedef void(^StartMeasureBlock)(DfthResult * _Nonnull result, NSTimeInterval startTime);
typedef void(^RegistBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull userId);
typedef void(^LoginBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull userId);
typedef void(^RegistMemberBlock)(DfthResult * _Nonnull result, DfthUser  * _Nonnull user);

typedef void(^GetDeviceHandler)(DfthResult * _Nonnull result, __kindof DfthDevice * _Nullable device);

typedef void(^DeviceVersionBlock)(DfthResult * _Nonnull result, NSString  * _Nonnull version);

typedef void(^BpVoiceBlock)(DfthResult * _Nonnull result, BpVoiceState state);
typedef void(^BpStateBlock)(DfthResult * _Nonnull result, DfthBpDeviceState * _Nullable state);
typedef void(^BpPlanBlock)(DfthResult *_Nonnull result, DfthBpPlan * _Nullable plan);
typedef void(^BpDataBlock)(DfthResult *_Nonnull result, BOOL isLastPage, NSArray<DfthBpData*> * _Nullable dataArray);
typedef void(^BpPlansBlock)(DfthResult *_Nonnull result, BOOL isLastPage, NSArray<DfthBpPlan*> * _Nullable dataArray);
typedef void(^NibpsList) (DfthResult *_Nonnull result, BOOL isLastPage, NSArray<BpListRecord*> *_Nullable recordArray);
typedef void(^AmbpsList) (DfthResult *_Nonnull result, BOOL isLastPage, NSArray<Response_BpGetPlan*> *_Nullable recordArray);
typedef void(^AmbpsNibpsList) (DfthResult *_Nonnull result, NSArray<AmbpsNibpsRecord*> *_Nullable recordArray);
//typedef void(^PrepareBlock)(DfthResult *_Nonnull result, DfthBpDeviceState * _Nullable state);

typedef void(^MemberInfoBlock)(DfthResult *_Nonnull result, DfthUser * _Nullable user);


typedef void(^DeviceInfoBlock)(DfthResult *_Nonnull result, Response_DeviceInfo * _Nullable deviceInfo);

typedef void(^DeviceListBlock)(DfthResult *_Nonnull result, NSMutableArray<Response_DeviceList *> * _Nullable deviceInfo);
typedef void(^DeviceBindBlock)(DfthResult *_Nonnull result, Response_DeviceBinding * _Nullable deviceInfo);
typedef void(^DeviceUnBindBlock)(DfthResult *_Nonnull result, Response_DeviceUnBind * _Nullable deviceInfo);
typedef void(^UserDevicelistBlock)(DfthResult *_Nonnull result,NSMutableArray<Response_UserDeviceList *> * _Nullable deviceInfo);
// 我的亲友部分
typedef void(^FriendCountBlock)(DfthResult *_Nonnull result, Response_FriendsCount * _Nullable friendsCount);
typedef void(^GetMemberBlock)(DfthResult *_Nonnull result, Response_getMember * _Nullable friendsList);
typedef void(^FindFriendsBlock)(DfthResult *_Nonnull result, NSMutableArray <Response_FindFriends *>* _Nullable friendsList);
typedef void(^FindApplyListBlock)(DfthResult *_Nonnull result, NSMutableArray <Response_FindApplyList *>* _Nullable friendsList);



typedef void(^CreateBpRecordBlock)(DfthResult *_Nonnull result, DfthBpData * _Nullable data);


typedef void(^EcgGetMeasureHistory)(DfthResult *_Nonnull result, BOOL isLastPage, NSArray<DfthEcgRecord*> * _Nullable recordArray);
typedef void(^ProgressBlock)(NSProgress *_Nonnull progress);
typedef void (^ProgressWithFileSizeBlock)(int64_t progress);
typedef void(^EcgRecordBlock)(DfthResult *_Nonnull result, DfthEcgRecord * _Nullable record);
typedef void(^EcgDownloadFileBlock)(DfthResult *_Nonnull result, NSString * _Nullable filePath);
typedef void(^EcgDeleteRecordBlock)(DfthResult *_Nonnull result, NSMutableArray<DfthEcgRecord *> * _Nullable deletedRecords);


typedef void(^DiseaseListBlock)(DfthResult *_Nonnull result, NSArray<Disease *> * _Nullable diseases);
typedef void(^HabitListBlock)(DfthResult *_Nonnull result, NSArray<Habit *> * _Nullable habits);

typedef void(^UploadAllBpData)(DfthResult *_Nonnull result, NSArray<DfthBpData *> * _Nullable datas);
typedef void(^UploadAllBpPlan)(DfthResult *_Nonnull result, NSArray<DfthBpPlan *> * _Nullable plans);
typedef void(^UploadBpPlan)(DfthResult *_Nonnull result, DfthBpPlan * _Nullable plan);


#pragma mark 费用相关
typedef void(^PackagesBlock)(DfthResult *_Nonnull result, NSArray<DfthPackage *> * _Nullable packages);

#endif /* DfthBlocks_h */
