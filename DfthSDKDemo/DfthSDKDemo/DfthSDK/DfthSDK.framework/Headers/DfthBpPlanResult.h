//
//  DfthBpPlanResult.h
//  DfthSDK
//
//  Created by yue gao on 2017/4/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BpPlan;

@interface DfthBpPlanResult : NSObject
@property(nonatomic, assign) int64_t measureBeginTime; //计划开始时间
@property(nonatomic, assign) int64_t measureEndTime; //计划结束时间
@property(nonatomic, assign) int duration; //执行时长(秒)
@property(nonatomic, assign) int daySystolicAvg; //日间高压平均
@property(nonatomic, assign) int dayDiastolicAvg; //日间低压平均值
@property(nonatomic, assign) int nightSystolicAvg; //夜间高压平均值
@property(nonatomic, assign) int nightDiastolicAvg; //夜间低压平均值
@property(nonatomic, assign) int systolicAvg; //全天高压平均值
@property(nonatomic, assign) int diastolicAvg; //全天低压平均值
@property(nonatomic, assign) int systolicAvgLevel; //高压平均压等级[0,未达标,1:平均压正常,2:平均压偏高,3:平均压很高]
@property(nonatomic, assign) int pattern; //形态[1：勺型、2：反勺型、3：非勺型]
@property(nonatomic, assign) int dayPulseRateAvg; //日间脉率平均值
@property(nonatomic, assign) int nightPulseRateAvg; //夜间脉率平均值
@property(nonatomic, assign) int pulseRateAvg; //全天脉率平均值
@property(nonatomic, assign) int standard; //本次测量血压数据是否符合24小时动态血压标准[1:达标,0:未达标]
@property(nonatomic, copy) NSString *analysis; //分析结果
@property(nonatomic, assign) int64_t saveTime; //保存时间

-(instancetype)initWith:(BpPlan *)bpPlan;

@end
