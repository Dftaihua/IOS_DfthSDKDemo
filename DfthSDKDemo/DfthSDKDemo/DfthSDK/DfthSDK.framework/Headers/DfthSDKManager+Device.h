//
//  DfthSDKManager+Device.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (Device)

/**
 * 获取设备信息
 *
 * @param mac 设备的mac地址
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getDeviceInfoTaskWith:(NSString *)mac completeHandler:(DeviceInfoBlock)handler;

/**
 * 获取设备列表
 *
 * @param mac 设备的mac地址
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getDeviceListTaskWith:(NSString *)mac completeHandler:(DeviceListBlock)handler;

/**
 * 为用户绑定设备
 *
 * @param userId 用户id
 * @param devType 设备类型
 * @param devVersion 设备版本号
 * @param mac 设备mac地址
 * @param bindTime 绑定时间
 * @param useTime 使用时间
 * @param useAddrProvince 省
 * @param useAddrCity 市
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getDeviceBindTaskWith:(NSString *)userId devType:(NSString *)devType devVersion:(NSString *)devVersion macAddr:(NSString *)mac bindTime:(NSString *)bindTime useTime:(int)useTime useAddrProvince:(NSString *)useAddrProvince useAddrCity:(NSString *)useAddrCity completeHandler:(DeviceBindBlock)handler;

/**
 * 为用户绑定设备
 *
 * @param userId 用户id
 * @param mac 设备mac地址
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getDeviceUnBindTaskWith:(NSString *)userId mac:(NSString *)mac completeHandler:(DeviceUnBindBlock)handler;



/**
 * 获取用户绑定的设备信息
 *
 * @param userId 用户id
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getUserDevicelistTaskWith:(NSString *)userId completeHandler:(UserDevicelistBlock)handler;

@end
