//
//  DfthSDKManager+User.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (User)

/**
 * 获取用户
 *
 * @param userId 用户id
 *
 * @return 用户
 */
+ (DfthUser *)getUser:(NSString *)userId;

/**
 * 获取注册时候的验证码
 *
 * @param telNumber 手机号
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getRequestVerifyCodeTaskWithTelNumber:(NSString *)telNumber completeHandler:(SimpleBlock)handler;

/**
 * 用户注册
 *
 * @param account 用户账号
 * @param password 密码
 * @param verifyCode 验证码
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getRegisterTaskWithAccount:(NSString *)account password:(NSString *)password verifyCode:(NSString *)verifyCode completeHandler:(RegistMemberBlock)handler;

/**
 * 用户登录
 *
 * @param account 用户账号
 * @param password 密码
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getLoginTaskWithAccount:(NSString *)account password:(NSString *)password completeHandler:(LoginBlock)handler;

/**
 * 用户注册
 *
 * @param userId 用户id
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getLoginTaskWithUserId:(NSString *)userId completeHandler:(LoginBlock)handler;

/**
 * 重置密码时候的验证码
 *
 * @param telNumber 手机号
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getResetPasswordVerifyCodeTaskWithTelNumber:(NSString *)telNumber completeHandler:(SimpleBlock)handler;


/**
 * 重置密码
 *
 * @param telNumber 手机号
 * @param password 密码
 * @param verifyCode 验证码
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getResetPasswordTaskWithTelNumber:(NSString *)telNumber password:(NSString *)password verifyCode:(NSString *)verifyCode completeHandler:(SimpleBlock)handler;

/**
 * 用户信息更新
 *
 * @param user 用户
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask*)getUpdateMemberInfoTaskWithUser:(DfthUser *)user completeHandler:(SimpleBlock)handler;

/**
 * 获取用户信息
 *
 * @param userId 用户
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getUserInfoTaskWith:(NSString *)userId completeHandler:(MemberInfoBlock)handler;


/**
 * 获取用户病史
 *
 * @param userId 用户
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getUserDiseaseListWith:(NSString *)userId complete:(DiseaseListBlock)handler;


/**
 * 创建用户病史
 *
 * @param userId 用户
 * @param diseases 疾病列表
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)diseaseCreateForUser:(NSString *)userId diseases:(NSArray<Disease*> *)diseases complete:(SimpleBlock)handler;


/**
 * 更新用户病史
 *
 * @param userId 用户
 * @param diseases 疾病列表
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)diseaseUpdateForUser:(NSString *)userId diseases:(NSArray<Disease*> *)diseases complete:(SimpleBlock)handler;


/**
 * 更新疾病字典
 *
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getDiseaseDictionaryWithComplete:(DiseaseListBlock)handler;

/**
 * 获取用户的生活习惯
 *
 * @param userId 用户
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getUserHabitListWith:(NSString *)userId complete:(HabitListBlock)handler;

/**
 * 创建用户的生活习惯
 *
 * @param userId 用户
 * @param habits 用户习惯
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)habitCreateWith:(NSString *)userId habits:(NSArray<Habit*> *)habits complete:(SimpleBlock)handler;

/**
 * 更新用户的生活习惯
 *
 * @param userId 用户
 * @param habits 用户习惯
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)habitUpdateWith:(NSString *)userId habits:(NSArray<Habit*> *)habits complete:(SimpleBlock)handler;

/**
 * 获取生活习惯的字典
 *
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getHabitDictionaryWithComplete:(HabitListBlock)handler;

@end
