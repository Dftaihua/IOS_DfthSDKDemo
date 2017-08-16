//
//  DfthBpData.h
//  DfthDB
//
//  Created by gaoyue on 2017/6/21.
//  Copyright © 2017年 gaoyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBaseObject.h"

typedef NS_ENUM(NSInteger, BpDataState) {
    BPDS_Init = 0,  // 数据状态：无状态
    //    BPDS_CreatedOnServer,   //已在服务器创建记录
    //    BPDS_Uploading,  //数据状态：正在上传
    BPDS_Uploaded, // 数据状态：上传成功
    //    BPDS_TaskCreated,
};


@interface DfthBpData : DBBaseObject
@property (nonatomic, copy) NSString *recordId;	//东方泰华数据库中该数据的id
@property (nonatomic, copy) NSString *userId;	//user索引
@property (nonatomic, copy) NSString *planId;
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *deviceMac;

@property (nonatomic, assign) long measureTime;	//测量时间，单位秒
@property (nonatomic, assign) BpDataState state;	//数据记录的状态
@property (nonatomic, assign) int measureMode;	//测量模式
@property (nonatomic, assign) int index;	//在测量计划中的序号
@property (nonatomic, assign) int sbp;	//收缩压，高压
@property (nonatomic, assign) int dbp;	//舒张压，低压
@property (nonatomic, assign) int pulseRate;	//心率
@property (nonatomic, assign) BOOL isValid;     //是否有效数据
@property (nonatomic, copy) NSString *analyseResult;    //分析结果

@property (nonatomic, copy) NSString *timeZone;     //时区

- (instancetype)initWith:(NSString *)userId deviceMac:(NSString *)deviceMac measureMode:(int)measureMode index:(int)index measureTime:(long)measureTime sbp:(int)sbp dbp:(int)dbp pulseRate:(int)pulseRate appId:(NSString *)appId;
@end
