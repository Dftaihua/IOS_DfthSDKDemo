//
//  DfthBpData.h
//  MyBluetooth
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BpData;

typedef NS_ENUM(NSInteger, BpMeasureMode) {
    BPMM_Manual = -1,  // 测量类型：手动测量（偶测）
    BPMM_Unkown = 0,  // 测量类型：全部类型
    BPMM_Plan = 1,  //测量类型：自动测量（动态血压计划）
    BPMM_Input = 2, // 测量类型：用户输入
};
typedef NS_ENUM(NSInteger, BpDataState) {
    BPDS_Init = 0,  // 数据状态：无状态
//    BPDS_CreatedOnServer,   //已在服务器创建记录
//    BPDS_Uploading,  //数据状态：正在上传
    BPDS_Uploaded, // 数据状态：上传成功
//    BPDS_TaskCreated,
};

@interface DfthBpData : NSObject

@property (nonatomic, copy) NSString *userId;	//user索引
@property (nonatomic, copy) NSString *planId;
@property (nonatomic, copy) NSString *deviceMac;
@property (nonatomic, copy) NSString *recordId;	//东方泰华数据库中该数据的id
@property (nonatomic, assign) BpDataState state;	//数据记录的状态
@property (nonatomic, assign) BpMeasureMode measureMode;	//
@property (nonatomic, assign) int index;	//在测量计划中的序号
@property (nonatomic, assign) int64_t measureTime;	//测量时间，单位秒
@property (nonatomic, assign) int sbp;	//收缩压，高压
@property (nonatomic, assign) int dbp;	//舒张压，低压
//@property (nonatomic, assign) int avg;	//？
@property (nonatomic, assign) int pulseRate;	//心率
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *analyseResult;
@property (nonatomic, assign) BOOL isValid;

- (instancetype)initWith:(BpData *)bpData;
//- (int)compareTo:(DfthBpData *)another;
- (instancetype)initWith:(NSString *)userId deviceMac:(NSString *)deviceMac measureMode:(BpMeasureMode)measureMode index:(int)index
             measureTime:(int64_t)measureTime sbp:(int)sbp dbp:(int)dbp pulseRate:(int)pulseRate  appId:(NSString *)appId;

@end
