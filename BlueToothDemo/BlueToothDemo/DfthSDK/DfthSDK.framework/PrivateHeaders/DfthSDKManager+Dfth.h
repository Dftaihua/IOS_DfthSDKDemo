//
//  DfthSDKManager+Dfth.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/8.
//  Copyright © 2017年 com.dfth.BlueToothLib. All rights reserved.
//

#import "DfthSDKManager.h"
#import "DfthSDKConfig.h"

@interface DfthSDKManager (Dfth)

+ (void)setConfig:(DfthSDKConfig *)config;

+ (DfthTask*)getRequestVerifyCodeTaskWithTelNumber:(NSString *)telNumber completeHandler:(SimpleBlock)handler;
+ (DfthTask*)getRegisterTaskWithAccount:(NSString *)account password:(NSString *)password tel:(NSString *)telNumber verifyCode:(NSString *)verifyCode completeHandler:(RegistBlock)handler;
+ (DfthTask*)getLoginTaskWithAccount:(NSString *)account password:(NSString *)password completeHandler:(LoginBlock)handler;
+ (DfthTask*)getLoginTaskWithUserId:(NSString *)userId completeHandler:(LoginBlock)handler;
+ (DfthTask*)getResetPasswordVerifyCodeTaskWithTelNumber:(NSString *)telNumber completeHandler:(SimpleBlock)handler;
+ (DfthTask*)getResetPasswordTaskWithTelNumber:(NSString *)telNumber password:(NSString *)password verifyCode:(NSString *)verifyCode completeHandler:(SimpleBlock)handler;
+ (DfthTask*)getUpdateMemberInfoTaskWithUser:(DfthUser *)user completeHandler:(SimpleBlock)handler;

@end
