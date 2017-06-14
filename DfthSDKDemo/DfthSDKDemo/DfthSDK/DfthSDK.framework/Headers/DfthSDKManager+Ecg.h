//
//  DfthSDKManager+Ecg.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (Ecg)

/**
 * 查询心电测量历史记录
 *
 * @param userId     用户Id
 * @param pageIndex   页码，1表示第一页
 * @param pageSize 每页包含的记录条数
 * @param startTime 开始时间
 * @param endTime 结束时间
 * @param sort 排序
 * @param handler 操作完成后的回调
 *
 * @return 符合要求的测量记录集合
 */
+ (DfthTask *)getUser:(NSString *)userId pageIndex:(int)pageIndex pageSize:(int)pageSize startTime:(int64_t)startTime endTime:(int64_t)endTime leadCount:(int)leadCount sort:(NSString *)sort complete:(EcgGetMeasureHistory)handler;

/**
 * 上传心电文件
 *
 * @param record  心电记录的实例
 * @param progress  上传进度
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)ecgUploadRecord:(DfthEcgRecord *)record progress:(ProgressBlock)progress completeHandler:(EcgRecordBlock)handler;

/**
 * 在医生服务平台创建医师服务任务
 *
 * @param record  心电记录的实例
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)ecgCreateTaskForRecord:(DfthEcgRecord *)record completeHandler:(EcgRecordBlock)handler;

/**
 * 查询心电的医师分析
 *
 * @param recordId  心电记录的id
 * @param userId   用户id
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)getEcgServiceWithRecordId:(NSString *)recordId userId:(NSString *)userId complete:(EcgRecordBlock)handler;

/**
 * 更新心电文件
 *
 * @param record  心电记录的实例
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)updateDatAndIniFilesForRecord:(DfthEcgRecord *)record complete:(EcgRecordBlock)handler;

/**
 * 从服务器下载心电全数据
 *
 * @param record  心电记录的实例
 * @param progress  下载的进度
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)ecgDownloadZipFile:(DfthEcgRecord *)record progress:(ProgressBlock)progress complete:(EcgRecordBlock)complete;


/**
 * 删除心电记录
 *
 * @param record  心电记录的实例
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)ecgDeleteRecord:(DfthEcgRecord *)record complete:(EcgRecordBlock)complete;

/**
 * 删除所有本地存储的心电文件，只删除已经上传到服务器的文件
 *
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)ecgDeleteLocalFiles:(SimpleBlock)complete;

/**
 * 计算所有本地存储的，可被删除的心电文件总大小
 *
 * @param complete 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)ecgSizesLocalFiles:(EcgSizesBlock)complete;
@end
