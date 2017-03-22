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
    BPMM_Unkown = 0,  // 测量类型：全部类型
    BPMM_Manual = 1,  // 测量类型：手动测量（偶测）
    BPMM_Plan = 2,  //测量类型：自动测量（动态血压计划）
    BPMM_Input = 3, // 测量类型：自动测量（动态血压计划）
};
typedef NS_ENUM(NSInteger, BpDataState) {
    BPDS_INIT = 1,  // 数据状态：无状态
    BPDS_UPLOADING = 2,  //数据状态：正在上传
    BPDS_UPLOADED = 3, // 数据状态：上传成功
};

@interface DfthBpData : NSObject

@property (nonatomic, strong) NSString *userId;	//user索引
@property (nonatomic, strong) NSString *planId;	//user索引
@property (nonatomic, strong) NSString *deviceMac;	//user索引
@property (nonatomic, strong) NSString *recordId;	//东方泰华数据库中该数据的id
@property (nonatomic, assign) int state;	//数据记录的状态，0未上传，1，已上传，2上传中
@property (nonatomic, assign) BpMeasureMode measureMode;	//
@property (nonatomic, assign) int index;	//在测量计划中的序号
@property (nonatomic, assign) long measureTime;	//测量时间
@property (nonatomic, assign) int sbp;	//
@property (nonatomic, assign) int dbp;	//
@property (nonatomic, assign) int avg;	//心率
@property (nonatomic, assign) int pulseRate;	//心率


- (instancetype)initWith:(BpData *)bpData;
- (int)compareTo:(DfthBpData *)another;
@end
