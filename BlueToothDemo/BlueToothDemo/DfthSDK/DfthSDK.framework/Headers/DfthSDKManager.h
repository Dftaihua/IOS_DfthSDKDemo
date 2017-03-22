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
#import "DfthBpData.h"
#import "DfthEcgRecord.h"


@interface DfthSDKManager : NSObject

+ (void)init;

/**
 * 销毁 DfthSDKManager
 */
+ (void)destroy;

/**
 *	初始化 DfthSDKManager
 * @param clientId 东方泰华提供的clientId
 * @param clientSecret 东方泰华提供的clientSecret
 * @param handler 执行结果的回调
 */
//+ (void)oauthWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret completeHandler:(OauthHandler)handler;
+ (DfthTask*)getOauthTaskWithClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret completeHandler:(SimpleBlock)handler;

/**
 * 	创建一个用户
 *
 * 	@param name 姓名
 * 	@param gender 性别   1=男，2=女
 *  @param birthday 生日
 *  @param mobile 手机
  * @param handler 执行结果的回调
 */
//+ (int)createUserWithName:(NSString *)name gender:(int)gender birtuserIdhday:(long)birthday andMobile:(NSString *)mobile;
//+ (void)registerUserWithName:(NSString *)name gender:(int)gender birthday:(long)birthday mobile:(NSString *)mobile completeHandler:(RegisterHandler)handler;
+ (DfthTask*)getRegisterTaskWithUserName:(NSString*)name gender:(int)gender birthday:(long)birthday mobile:(NSString *)mobile completeHandler:(RegistBlock)handler;

/**
 * 扫描东方泰华设备,扫描结果以广播的形式返回
 *
 * @param deviceMac 指定需要扫描的设备mac地址
 * @param deviceType 指定需要扫描的设备类型
 *                   DfthDevice.EcgDevice 心电设备
 *                   DfthDevice.BpDevice 血压设备
 *                   DfthDevice.Unknown 不指定，即扫描全部类型
 * @return 请查阅东方泰华返回值 {@link DfthReturnCode}
 */
//+ (DfthReturnCode)scanDevice:(NSString *)deviceMac ofType:(DfthDeviceType)deviceType;

/**
 *  停止扫描
 */
//+ (void)stopScan;

/**
 *	获取指定设备
 *
 * @param mac 设备mac地址
 * @param userId 用户ID
 * @param delegate 获取
 *
 * @return 设备实例或null
 */
//+ (id)getDevice:(NSString *)mac forUser:(NSString *)userId withDelegate:(id)delegate;

+ (DfthTask *)getSingleEcgDevice:(NSString *)deviceMac completeHandler:(GetSingleEcgDeviceHandler)handler;
+ (DfthTask *)getTwelveEcgDevice:(NSString *)deviceMac completeHandler:(GetTwelveEcgDeviceHandler)handler;
+ (DfthTask *)getBpDevice:(NSString *)deviceMac completeHandler:(GetBpDeviceHandler)handler;


/**
 * 查询心电测量历史记录+++++++IOS未实现
 *
 * @param userId     用户Id
 * @param pageNo   页码，1表示第一页
 * @param howManyItems 每页包含的记录条数
 *
 * @return 符合要求的测量记录集合
 */
+ (NSArray<DfthEcgRecord *> *)getUser:(NSString *)userId ecgRecordsAtPage:(int)pageNo whichContains:(int)howManyItems;

/**
 * 查询用户的动态血压测量计划+++++++IOS未实现
 *
 * @param userId     用户Id
 * @param pageNo   页码，1表示第一页
 * @param howManyItems 每页包含的记录条数
 *
 * @return 符合要求的测量计划集合
 */
+ (NSArray<DfthBpPlan*> *)getUser:(NSString *)userId bpPlansAtPage:(int)pageNo whichContains:(int)howManyItems;
/**
 * 查询血压测量数据+++++++IOS未实现
 *
 * @param userId 用户Id
 * @param mode 数据类型 BPMM_Unkown, BPMM_Manual, BPMM_Plan, BPMM_Input
 * @param startTime 开始时间
 * @param endTime	结束时间
 * 					数据的测量时间在开始时间和结束时间范围内，则在时间上该记录符合查询要求
 *
 * @return 返回符合查询条件的数据集合
 */
+ (NSArray<DfthBpData*> *)getUser:(NSString *)userId bpDatasOfMeasureMode:(int)mode whichMeasuredBetween:(long)startTime and:(long)endTime;

///**
// * 打印当前设备列表
// */
//+ (NSString *)printDeviceList;
//
///**
// * 打印上一次扫描中发现的所有设备信息
// */
//+ (NSString *)printDiscoveredList;

@end
