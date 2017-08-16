//
//  DfthSDKManager+Bp.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (Bp)

/**
 * 查询用户的动态血压测量计划
 *
 * @param userId   用户Id
 * @param pageNo   页码，1表示第一页
 * @param howManyItems 每页包含的记录条数
 *
 * @return 符合要求的测量计划集合
 */
+ (NSArray<DfthBpPlan*> *)getUser:(NSString *)userId bpPlansAtPage:(int)pageNo whichContains:(int)howManyItems;

+ (DfthTask *)getBpPlanWithUser:(NSString *)userId pageIndex:(int)pageIndex pageSize:(int)pageSize startTime:(int64_t)startTime endTime:(int64_t)endTime sort:(NSString *)sort complete:(BpPlansBlock)handler;

/**
 * 查询血压测量数据
 *
 * @param userId 用户Id
 * @param mode 数据类型 BPMM_Unkown, BPMM_Manual, BPMM_Plan, BPMM_Input
 * @param startTime 开始时间
 * @param endTime	结束时间
 * 					数据的测量时间在开始时间和结束时间范围内，则在时间上该记录符合查询要求
 *
 * @return 返回符合查询条件的数据集合
 */
+ (NSArray<DfthBpData*> *)getUser:(NSString *)userId bpDatasOfMeasureMode:(int)mode whichMeasuredBetween:(int64_t)startTime and:(int64_t)endTime;
+ (DfthTask *)getBpDataWithUser:(NSString *)userId pageIndex:(int)pageIndex pageSize:(int)pageSize startTime:(int64_t)startTime endTime:(int64_t)endTime sort:(NSString *)sort complete:(BpDataBlock)handler;

/**
 * 上传所有血压数据到服务器
 *
 * @param userId 用户id
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)uploadAllBpDataForUser:(NSString *)userId complete:(UploadAllBpData)complete;

/**
 * 上传所有血压计划到服务器
 *
 * @param userId 用户id
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)uploadAllBpPlanForUser:(NSString *)userId complete:(UploadAllBpPlan)complete;

/**
 * 上传指定的血压计划到服务器
 *
 * @param plan 血压计划
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)uploadBpPlan:(DfthBpPlan *)plan complete:(UploadBpPlan)complete;


+ (DfthTask *)getNibpsListWithUser:(NSString *)userId pageIndex:(int)pageIndex pageSize:(int)pageSize startTime:(int64_t)startTime endTime:(int64_t)endTime sort:(NSString *)sort complete:(BpDataBlock)handler;

+ (DfthTask *)getAmbpsListWithUser:(NSString *)userId pageIndex:(int)pageIndex pageSize:(int)pageSize startTime:(int64_t)startTime endTime:(int64_t)endTime sort:(NSString *)sort complete:(BpPlansBlock)handler;

+ (DfthTask *)getAmbpsNibpsWithUser:(NSString *)userId planId:(NSString *)planId complete:(AmbpsNibpsList)handler;

@end
