//
//  DfthSDKConfig.h
//  DfthSDK
//
//  Created by admin on 2017/1/21.
//  Copyright © 2017年 com.dfth.BlueToothLib. All rights reserved.
//

#import "BaseArchiveObject.h"
#import "ECGConfig.h"
#import "BPConfig.h"
#import "DeviceConfig.h"
#import "OauthConfig.h"

@interface DfthSDKConfig : BaseArchiveObject
@property(nonatomic, strong) ECGConfig *ecgConfig;//心电配置
@property(nonatomic, strong) BPConfig *bpConfig;//血压配置
@property(nonatomic, strong) DeviceConfig *deviceConfig;//设备配置
@property(nonatomic, strong) OauthConfig *oauthConfig;//认证配置

+ (DfthSDKConfig*)readLoaclConfigFile;
- (void)saveToLocalFile;
+ (NSString *)getSDKVersion;

@end
