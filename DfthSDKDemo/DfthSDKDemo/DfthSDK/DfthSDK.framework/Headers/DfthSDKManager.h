//
//  DfthSDKManager.h
//  MyBluetooth
//
//  Created by admin on 2016/11/11.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthDeviceConstants.h"
#import "DfthBlocks.h"
#import "DfthTask.h"


#import "DfthBluetoothStateDelegate.h"

@interface DfthSDKManager : NSObject

/**
 * 程序启动后需要立即调用此接口初始化sdk，建议放在AppDelegate中调用
 */
+ (void)init;

/**
 * 销毁 DfthSDKManager
 */
+ (void)destroy;

/**
 * 机构认证
 * @param clientId 东方泰华提供的clientId
 * @param clientSecret 东方泰华提供的clientSecret
 * @param handler 执行结果的回调
 */
+ (DfthTask*)getOauthTaskWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret completeHandler:(SimpleBlock)handler;

/**
 * 	创建用户
 *
 * 	@param name 姓名
 * 	@param gender 性别   1=男，2=女
 *  @param birthday 生日
 *  @param mobile 手机
  * @param handler 执行结果的回调
 */
+ (DfthTask*)getRegisterTaskWithUserName:(NSString*)name gender:(int)gender birthday:(int64_t)birthday mobile:(NSString *)mobile completeHandler:(RegistBlock)handler;

/**
 *	获取设备
 *
 * @param deviceMac 指定需要连接的设备的mac地址，可以为nil
 * @param type 用户ID
 * @param handler 任务执行完成的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getDevice:(NSString *)deviceMac ofType:(DfthDeviceType)type completeHandler:(GetDeviceHandler)handler;



/**
 * 委托监听蓝牙状态变化
 *
 * @param delegate 接收状态变化的回调
 *
 */
+ (void)appendBluetoothStateDelegate:(id<DfthBluetoothStateDelegate>)delegate;

/**
 * 取消监听蓝牙状态变化
 *
 * @param delegate 被移除的回调
 *
 */
+ (void)removeBluetoothStateDelegate:(id<DfthBluetoothStateDelegate>)delegate;

/**
 * 查询手机蓝牙状态
 *
 *
 * @return true 手机蓝牙开启, false 手机蓝牙关闭
 */
+ (BOOL)isBluetoothAdapterOn;


@end
