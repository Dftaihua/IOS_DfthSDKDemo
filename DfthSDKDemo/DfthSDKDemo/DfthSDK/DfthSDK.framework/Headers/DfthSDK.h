//
//  DfthSDK.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/10.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for DfthSDK.
FOUNDATION_EXPORT double DfthSDKVersionNumber;

//! Project version string for DfthSDK.
FOUNDATION_EXPORT const unsigned char DfthSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <DfthSDK/PublicHeader.h>

#import <DfthNetwork/DfthNetwork.h>
#import "DfthSDKManager.h"
#import "DfthSDKManager+Ecg.h"
#import "DfthSDKManager+Bp.h"
#import "DfthSDKManager+User.h"
#import "DfthSDKManager+Money.h"
#import "DfthSDKManager+Friends.h"
#import "DfthSDKManager+Device.h"

#import "DfthBpDeviceDelegate.h"
#import "DfthSingleEcgDelegate.h"
#import "DfthTwelveEcgDelegate.h"

#import "DfthSingleEcgDevice.h"
#import "DfthTwelveEcgDevice.h"
#import "DfthBpDevice.h"

#import "DfthBpDeviceState.h"

#import "DfthEcgFilesReader.h"
#import "DfthPackage.h"

#import "BaseArchiveObject.h"
#import "BpAnalysisConfig.h"
#import "BPConfig.h"
#import "BpUploadConfig.h"
#import "DeviceConfig.h"
#import "DfthSDKConfig.h"
#import "ECGAnalysisConfig.h"
#import "ECGConfig.h"
#import "ECGDownloadConfig.h"
#import "ECGMeasureConfig.h"
#import "ECGStorageConfig.h"
#import "ECGTemplateConfig.h"
#import "ECGUploadConfig.h"
#import "EmergencyECGConfig.h"
#import "OauthConfig.h"
#import "PhysicalSymptomConfig.h"

#import <DfthDB/DfthDB.h>
#ifdef DEBUG
#import "DfthSDKManager+debug.h"
#import "DfthBpPlan+SDK.h"
#else
#endif
