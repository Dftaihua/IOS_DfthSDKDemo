//
//  DfthNetManager.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthNetConfig.h"
#import "DfthNetTask.h"

#import "Request_Oauth.h"
#import "Delegate_Oauth.h"
#import "Request_AccessToken.h"
#import "Delegate_AccessToken.h"
#import "Request_ServiceState.h"
#import "Delegate_ServiceState.h"
#import "Request_RegistCooperatorUser.h"
#import "Delegate_RegistCooperatorUser.h"

#import "Request_MemberLogin.h"
#import "Delegate_MemberLogin.h"
#import "Request_MemberRegist.h"
#import "Delegate_MemberRegist.h"
#import "Request_MemberResetPassword.h"
#import "Delegate_MemberResetPassword.h"
#import "Request_MemberUpdate.h"
#import "Delegate_MemberUpdate.h"
#import "Request_ResetPasswordVerifyCode.h"
#import "Delegate_ResetPasswordVerifyCode.h"
#import "Request_MemberInfo.h"
#import "Delegate_MemberInfo.h"
#import "Request_RegistVerifyCode.h"
#import "Delegate_RegistVerifyCode.h"
#import "Request_MemberLoginByVerifyCode.h"
#import "Delegate_MemberLoginByVerifyCode.h"

#import "Request_AccountPass.h"
#import "Delegate_AccountPass.h"

#import "Request_EcgSlice.h"
#import "Delegate_EcgSlice.h"
#import "Request_EcgCreateRecord.h"
#import "Delegate_EcgCreateRecord.h"
#import "Request_EcgUploadComplete.h"
#import "Delegate_EcgUploadComplete.h"
#import "Request_EcgUploadWithData.h"
#import "Delegate_EcgUploadWithData.h"
#import "Request_EcgUpdateAnalyseResult.h"
#import "Delegate_EcgUpdateAnalyseResult.h"
#import "Request_EcgRequestUploadProgress.h"
#import "Delegate_EcgRequestUploadProgress.h"
#import "Request_EcgMeasureHistory.h"
#import "Delegate_EcgMeasureHistory.h"
#import "Request_EcgGetServiceResult.h"
#import "Delegate_EcgGetServiceResult.h"
#import "Request_EcgDownloadZipFile.h"
#import "Delegate_EcgDownloadZipFile.h"
#import "Request_EcgDownloadFile.h"
#import "Delegate_EcgDownloadFile.h"
#import "Request_EcgDeleteRecords.h"
#import "Delegate_EcgDeleteRecords.h"

#import "Request_CreateTask.h"
#import "Delegate_CreateTask.h"
#import "Request_BpCreatePlan.h"
#import "Delegate_BpCreatePlan.h"
#import "Request_BpCreateRecord.h"
#import "Delegate_BpCreateRecord.h"
#import "Request_BpCreateRecords.h"
#import "Delegate_BpCreateRecords.h"
#import "Request_BpGetPlan.h"
#import "Delegate_BpGetPlan.h"
#import "Request_NibpsList.h"
#import "Delegate_NibpsList.h"
#import "Request_AmbpsList.h"
#import "Delegate_AmbpsList.h"
#import "Request_AmbpsNibps.h"
#import "Delegate_AmbpsNibps.h"

#import "Request_GetUserDiseaseList.h"
#import "Delegate_GetUserDiseaseList.h"
#import "Request_DiseaseCreate.h"
#import "Delegate_DiseaseCreate.h"
#import "Request_DiseaseUpdate.h"
#import "Delegate_DiseaseUpdate.h"
#import "Delegate_GetDiseaseDictionary.h"

#import "Delegate_GetUserHabitList.h"
#import "Request_HabitCreate.h"
#import "Delegate_HabitCreate.h"
#import "Request_HabitUpdate.h"
#import "Delegate_HabitUpdate.h"
#import "Delegate_GetHabitDictionary.h"


#import "Request_UploadAFile.h"
#import "Delegate_UploadAFile.h"
#import "Request_DownloadAvatar.h"
#import "Delegate_DownloadAvatar.h"

//#import "Request_FriendsList.h"
//#import "Delegate_FriendsList.h"
#import "Request_FriendsCount.h"
#import "Delegate_FriendCount.h"
#import "Request_getMember.h"
#import "Delegate_getMember.h"
#import "Request_ApplyFriend.h"
#import "Delegate_ApplyFriend.h"
#import "Request_FindFriends.h"
#import "Delegate_FindFriends.h"
#import "Request_FindApplyList.h"
#import "Delegate_FindApplyList.h"
#import "Request_ApplyResult.h"
#import "Delegate_ApplyResult.h"
#import "Request_EditFriend.h"
#import "Delegate_EditFriend.h"


#import "Request_DeviceInfo.h"
#import "Delegate_DeviceInfo.h"
#import "Request_DeviceList.h"
#import "Delegate_DeviceList.h"
#import "Request_DeviceUnBind.h"
#import "Delegate_DeviceUnBind.h"
#import "Request_DeviceBinding.h"
#import "Delegate_DeviceBinding.h"
#import "Request_UserDeviceList.h"
#import "Delegate_UserDeviceList.h"

#import "Request_GetFreePackages.h"
#import "Delegate_GetFreePackages.h"
#import "Request_MakeAnOrder.h"
#import "Delegate_MakeAnOrder.h"
#import "Request_OrderConform.h"
#import "Delegate_OrderConform.h"


#import "Delegate_GetConfigFile.h"
#import "DfthNetStateDelegate.h"

 
@interface DfthNetManager : NSObject

+ (void)initWithNetworking;
+ (void)setAccessToken:(NSString *)token;
#pragma mark 网络状态代理
+ (void)appendNetStateDelegate:(id<DfthNetStateDelegate>)delegate;
+ (void)removeNetStateDelegate:(id<DfthNetStateDelegate>)delegate;
+ (NetworkStatus)getNetworkStatus;
+ (BOOL)isReachable;

#pragma mark 认证
+ (DfthNetTask *)oauth:(Request_Oauth *)request delegate:(id<Delegate_Oauth>)delegate;
+ (DfthNetTask *)getAccessToken:(Request_AccessToken *)request delegate:(id<Delegate_AccessToken>)delegate;
+ (DfthNetTask *)getServiceState:(Request_ServiceState *)request delegate:(id<Delegate_ServiceState>)delegate;
+ (DfthNetTask *)registCooperatorUser:(Request_RegistCooperatorUser *)request delegate:(id<Delegate_RegistCooperatorUser>) delegate;

#pragma mark 用户
+ (DfthNetTask *)memberLogin:(Request_MemberLogin *)request delegate:(id<Delegate_MemberLogin>)delegate;
+ (DfthNetTask *)memberRegist:(Request_MemberRegist *)request delegate:(id<Delegate_MemberRegist>)delegate;
+ (DfthNetTask *)memberResetPassword:(Request_MemberResetPassword *)request delegate:(id<Delegate_MemberResetPassword>)delegate;
+ (DfthNetTask *)memberUpdate:(Request_MemberUpdate *)request delegate:(id<Delegate_MemberUpdate>)delegate;
+ (DfthNetTask *)resetPasswordVerifyCode:(Request_ResetPasswordVerifyCode *)request delegate:(id<Delegate_ResetPasswordVerifyCode>)delegate;
+ (DfthNetTask *)memberInfo:(Request_MemberInfo *)request delegate:(id<Delegate_MemberInfo>)delegate;
+ (DfthNetTask *)registVerifyCode:(Request_RegistVerifyCode *)request delegate:(id<Delegate_RegistVerifyCode>)delegate;
+ (DfthNetTask *)memberLoginByVerifyCode:(Request_MemberLoginByVerifyCode *)request delegate:(id<Delegate_MemberLoginByVerifyCode>)delegate;
+ (DfthNetTask *)accountPass:(Request_AccountPass *)request delegate:(id<Delegate_AccountPassword>)delegate;

#pragma mark 设备
+ (DfthNetTask *)deviceInfo:(Request_DeviceInfo *)request delegate:(id<Delegate_DeviceInfo>)delegate;
+ (DfthNetTask *)deviceList:(Request_DeviceList *)request delegate:(id<Delegate_DeviceList>)delegate;
+ (DfthNetTask *)deviceBind:(Request_DeviceBinding *)request delegate:(id<Delegate_DeviceBinding>)delegate;
+ (DfthNetTask *)deviceUnBind:(Request_DeviceUnBind *)request delegate:(id<Delegate_DeviceUnBind>)delegate;
+ (DfthNetTask *)userDeviceList:(Request_UserDeviceList *)request delegate:(id<Delegate_UserDeviceList>)delegate;
#pragma mark 我的亲友部分
//+ (DfthNetTask *)friendsList:(Request_FriendsList *)request delegate:(id<Delegate_FriendsList>)delegate;
+ (DfthNetTask *)friendsCount:(Request_FriendsCount *)request delegate:(id<Delegate_FriendCount>)delegate;
+ (DfthNetTask *)getmember:(Request_getMember *)request delegate:(id<Delegate_getMember>)delegate;
+ (DfthNetTask *)applyfriend:(Request_ApplyFriend *)request delegate:(id<Delegate_ApplyFriend>)delegate;
+ (DfthNetTask *)findfriends:(Request_FindFriends *)request delegate:(id<Delegate_FindFriends>)delegate;
+ (DfthNetTask *)findapplylist:(Request_FindApplyList *)request delegate:(id<Delegate_FindApplyList>)delegate;
+ (DfthNetTask *)applyResult:(Request_ApplyResult *)request delegate:(id<Delegate_ApplyResult>)delegate;
+ (DfthNetTask *)editfriend:(Request_EditFriend *)request delegate:(id<Delegate_EditFriend>)delegate;


#pragma mark ECG
+ (DfthNetTask *)ecgCreateRecord:(Request_EcgCreateRecord *)request delegate:(id<Delegate_EcgCreateRecord>)delegate;
+ (DfthNetTask *)ecgRequestUploadProgress:(Request_EcgRequestUploadProgress *)request delegate:(id<Delegate_EcgRequestUploadProgress>)delegate;
+ (DfthNetTask *)ecgUploadWithData:(Request_EcgUploadWithData *)request progress:(void (^)(NSProgress *progress)) progress delegate:(id<Delegate_EcgUploadWithData>)delegate;
+ (DfthNetTask *)ecgUploadComplete:(Request_EcgUploadComplete *)request delegate:(id<Delegate_EcgUploadComplete>)delegate;
+ (DfthNetTask *)ecgUpdateAnalyseResult:(Request_EcgUpdateAnalyseResult *)request delegate:(id<Delegate_EcgUpdateAnalyseResult>)delegate;
+ (DfthNetTask *)ecgSlice:(Request_EcgSlice *)request delegate:(id<Delegate_EcgSlice>)delegate;
+ (DfthNetTask *)ecgMeasureHistory:(Request_EcgMeasureHistory *)request delegate:(id<Delegate_EcgMeasureHistory>)delegate;
+ (DfthNetTask *)ecgGetServiceResult:(Request_EcgGetServiceResult *)request delegate:(id<Delegate_EcgGetServiceResult>)delegate;
+ (DfthNetTask *)ecgDownloadZipFile:(Request_EcgDownloadZipFile *)request progress:(void (^)(NSProgress *progress))progress delegate:(id<Delegate_EcgDownloadZipFile>)delegate;
+ (DfthNetTask *)ecgDownloadFile:(Request_EcgDownloadFile *)request progress:(void (^)(NSProgress *progress))progress delegate:(id<Delegate_EcgDownloadFile>)delegate;
+ (DfthNetTask *)ecgDeleteRecords:(Request_EcgDeleteRecords *)request delegate:(id<Delegate_EcgDeleteRecords>)delegate;

#pragma mark BP
+ (DfthNetTask *)createTask:(Request_CreateTask *)request delegate:(id<Delegate_CreateTask>)delegate;
+ (DfthNetTask *)bpCreateRecord:(Request_BpCreateRecord *)request delegate:(id<Delegate_BpCreateRecord>)delegate;
+ (DfthNetTask *)bpCreateRecords:(Request_BpCreateRecords *)request delegate:(id<Delegate_BpCreateRecords>)delegate;
+ (DfthNetTask *)bpCreatePlan:(Request_BpCreatePlan *)request delegate:(id<Delegate_BpCreatePlan>)delegate;
+ (DfthNetTask *)bpGetPlan:(Request_BpGetPlan *)request delegate:(id<Delegate_BpGetPlan>)delegate;
+ (DfthNetTask *)nibpsListRecord:(Request_NibpsList *)request delegate:(id<Delegate_NibpsList>)delegate;
+ (DfthNetTask *)ambpsListRecord:(Request_AmbpsList *)request delegate:(id<Delegate_AmbpsList>)delegate;
+ (DfthNetTask *)ambpsNibpsRecord:(Request_AmbpsNibps *)request delegate:(id<Delegate_AmbpsNibps>)delegate;



#pragma mark 病史类和生活习惯类
+ (DfthNetTask *)getUserDiseaseList:(Request_GetUserDiseaseList *)request delegate:(id<Delegate_GetUserDiseaseList>)delegate;
+ (DfthNetTask *)diseaseCreate:(Request_DiseaseCreate *)request delegate:(id<Delegate_DiseaseCreate>)delegate;
+ (DfthNetTask *)diseaseUpdate:(Request_DiseaseUpdate *)request delegate:(id<Delegate_DiseaseUpdate>)delegate;
+ (DfthNetTask *)getDiseaseDictionaryWithDelegate:(id<Delegate_GetDiseaseDictionary>)delegate;

+ (DfthNetTask *)getHabitListForUser:(NSString *)userId delegate:(id<Delegate_GetUserHabitList>)delegate;
+ (DfthNetTask *)habitCreate:(Request_HabitCreate *)request delegate:(id<Delegate_HabitCreate>)delegate;
+ (DfthNetTask *)habitUpdate:(Request_HabitUpdate *)request delegate:(id<Delegate_HabitUpdate>)delegate;
+ (DfthNetTask *)getHabitDictionaryWithDelegate:(id<Delegate_GetHabitDictionary>)delegate;


#pragma mark  头像上传下载
+ (DfthNetTask *)getUploadAFile:(Request_UploadAFile *)request delegate:(id<Delegate_UploadAFile>)delegate;
+ (DfthNetTask *)getDownloadAdatar:(Request_DownloadAvatar *)request delegate:(id<Delegate_DownloadAvatar>)delegate;


#pragma mark 费用相关
+ (DfthNetTask *)getFreePackages:(Request_GetFreePackages *)request delegate:(id<Delegate_GetFreePackages>)delegate;
+ (DfthNetTask *)makeAnOrder:(Request_MakeAnOrder *)request delegate:(id<Delegate_MakeAnOrder>)delegate;
+ (DfthNetTask *)orderConform:(Request_OrderConform *)request delegate:(id<Delegate_OrderConform>)delegate;

+ (DfthNetTask *)getConfigFileWithClientId:(NSString *)clientId delegate:(id<Delegate_GetConfigFile>)delegate;
@end
