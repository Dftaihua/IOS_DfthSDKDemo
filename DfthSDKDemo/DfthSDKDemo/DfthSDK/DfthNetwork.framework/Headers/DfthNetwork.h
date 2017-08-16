//
//  DfthNetwork.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for DfthNetwork.
FOUNDATION_EXPORT double DfthNetworkVersionNumber;

//! Project version string for DfthNetwork.
FOUNDATION_EXPORT const unsigned char DfthNetworkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <DfthNetwork/PublicHeader.h>

#import "DfthNetManager.h"
#import "DfthNetTask.h"
#import "DfthNetConfig.h"
#import "DfthNetResult.h"
#import "DfthSyncResult.h"
#import "DfthNetStateDelegate.h"

#import "Request_BpCreatePlan.h"
#import "Request_BpGetPlan.h"
#import "Request_CreateTask.h"
#import "Request_BpCreateRecord.h"
#import "Request_EcgCreateRecord.h"
#import "Request_EcgUpdateAnalyseResult.h"
#import "Request_EcgRequestUploadProgress.h"
#import "Request_EcgUploadComplete.h"
#import "Request_EcgSlice.h"
#import "Request_EcgUploadWithData.h"
#import "Request_EcgMeasureHistory.h"
#import "Request_EcgGetServiceResult.h"
#import "Request_EcgDownloadZipFile.h"
#import "Request_EcgDownloadFile.h"
#import "Request_AccessToken.h"
#import "Request_RegistCooperatorUser.h"
#import "Request_Oauth.h"
#import "Request_ServiceState.h"
#import "Request_MemberLogin.h"
#import "Request_MemberInfo.h"
#import "Request_MemberRegist.h"
#import "Request_RegistVerifyCode.h"
#import "Request_MemberResetPassword.h"
#import "Request_ResetPasswordVerifyCode.h"
#import "Request_MemberUpdate.h"
#import "Request_GetFreePackages.h"
#import "Request_MakeAnOrder.h"
#import "Request_OrderConform.h"
#import "Request_UserDeviceList.h"
#import "Request_AccountPass.h"

#import "Response_BpCreatePlan.h"
#import "Response_BpGetPlan.h"
#import "Response_CreateTask.h"
#import "Response_BpCreateRecord.h"
#import "Response_EcgCreateRecord.h"
#import "Response_EcgUpdateAnalyseResult.h"
#import "Response_EcgRequestUploadProgress.h"
#import "Response_EcgUploadComplete.h"
#import "Response_EcgSlice.h"
#import "Response_EcgUploadWithData.h"
#import "EcgNetRecord.h"
#import "Response_AccessToken.h"
#import "Response_RegistCooperatorUser.h"
#import "Response_Oauth.h"
#import "Response_ServiceState.h"
#import "Response_MemberLogin.h"
#import "Response_MemberInfo.h"
#import "Response_MemberInfo.h"
#import "Response_MemberRegist.h"
#import "Response_RegistVerifyCode.h"
#import "Response_MemberResetPassword.h"
#import "Response_ResetPasswordVerifyCode.h"
#import "Response_MemberUpdate.h"
#import "Response_Package.h"
#import "Response_MakeAnOrder.h"
#import "Response_GetConfigFile.h"
#import "Response_UserDeviceList.h"
#import "Response_AccountPass.h"

#import "Delegate_BpCreatePlan.h"
#import "Delegate_BpGetPlan.h"
#import "Delegate_CreateTask.h"
#import "Delegate_BpCreateRecord.h"
#import "Delegate_EcgCreateRecord.h"
#import "Delegate_EcgUpdateAnalyseResult.h"
#import "Delegate_EcgRequestUploadProgress.h"
#import "Delegate_EcgUploadComplete.h"
#import "Delegate_EcgSlice.h"
#import "Delegate_EcgUploadWithData.h"
#import "Delegate_EcgMeasureHistory.h"
#import "Delegate_EcgGetServiceResult.h"
#import "Delegate_EcgDownloadZipFile.h"
#import "Delegate_EcgDownloadFile.h"
#import "Delegate_AccessToken.h"
#import "Delegate_RegistCooperatorUser.h"
#import "Delegate_Oauth.h"
#import "Delegate_ServiceState.h"
#import "Delegate_MemberLogin.h"
#import "Delegate_MemberInfo.h"
#import "Delegate_MemberRegist.h"
#import "Delegate_RegistVerifyCode.h"
#import "Delegate_MemberResetPassword.h"
#import "Delegate_ResetPasswordVerifyCode.h"
#import "Delegate_MemberUpdate.h"
#import "Delegate_GetFreePackages.h"
#import "Delegate_MakeAnOrder.h"
#import "Delegate_OrderConform.h"
#import "Delegate_GetConfigFile.h"
#import "Delegate_UserDeviceList.h"
#import "Delegate_AccountPass.h"

//病史类和生活习惯类
#import "Request_GetUserDiseaseList.h"
#import "Request_DiseaseCreate.h"
#import "Request_DiseaseUpdate.h"
#import "Request_HabitCreate.h"
#import "Request_HabitUpdate.h"

#import "Disease.h"
#import "Habit.h"

#import "Delegate_GetUserDiseaseList.h"
#import "Delegate_DiseaseCreate.h"
#import "Delegate_DiseaseUpdate.h"
#import "Delegate_GetDiseaseDictionary.h"
#import "Delegate_GetUserHabitList.h"
#import "Delegate_HabitCreate.h"
#import "Delegate_HabitUpdate.h"
#import "Delegate_GetHabitDictionary.h"

#import "Request_UploadAFile.h"
#import "Delegate_UploadAFile.h"
#import "Request_DownloadAvatar.h"
#import "Delegate_DownloadAvatar.h"


#import "Request_EcgDeleteRecords.h"
#import "Delegate_EcgDeleteRecords.h"
