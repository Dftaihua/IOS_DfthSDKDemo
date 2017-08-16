//
//  DfthSDKManager+debug.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/29.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (debug)
//+ (DfthTask *)uploadRecord:(DfthEcgRecord *)record suffix:(NSString *)suffix complete:(SimpleBlock)handler;
//+ (DfthTask *)upload:(NSData *)data forRecord:(DfthEcgRecord *)record complete:(SimpleBlock)handler;
//+ (DfthTask *)uploadComplete:(DfthEcgRecord *)record complete:(SimpleBlock)handler;
//+ (DfthTask *)createTaskFor:(DfthEcgRecord *)record complete:(SimpleBlock)handler;

+ (DfthBpPlan *)makeBpPlanByDayInterval:(int)dayInterval nigthInterval:(int)nigthInterval alarm:(int)alarmTime;
+ (DfthBpData *)parseBpDataBySbp:(int)sbp dbp:(int)dbp pulseRate:(int)pulseRate;

+ (void)insertBpDatas:(NSArray<DfthBpData *> *) datas;
+ (void)insertBpPlan:(DfthBpPlan *)plan;

+ (DfthTask *)ecgDownloadFile:(DfthEcgRecord *)record suffix:(NSString *)suffix progress:(ProgressBlock)progress complete:(EcgDownloadFileBlock)complete;

+ (void)statisticForRecord:(DfthEcgRecord *)record;

+ (void)transportFilesOnlyWifi:(BOOL)value;
+ (BOOL)isTransportFilesOnlyWifi;
@end
