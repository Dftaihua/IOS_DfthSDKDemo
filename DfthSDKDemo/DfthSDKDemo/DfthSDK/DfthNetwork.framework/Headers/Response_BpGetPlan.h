//
//  Response_BpGetPlan.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_BpGetPlan : NSObject
@property(nonatomic, copy) NSString *id; //动态血压id
@property(nonatomic, copy) NSString *mId; //用户id
@property(nonatomic, assign) int64_t measuringBegin; //计划开始时间
@property(nonatomic, assign) int64_t measuringEnd; //计划结束时间
@property(nonatomic, assign) int duration; //执行时长(秒)
@property(nonatomic, assign) int dayInterval; //日间计划测量间隔(分钟)
@property(nonatomic, assign) int nightInterval; //夜间计划测量间隔(分钟)
@property(nonatomic, assign) int dayCount; //日间实际测量次数
@property(nonatomic, assign) int nightCount; //夜间实际测量次数
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
@property(nonatomic, copy) NSString *sourceApp; //来源appId
@property(nonatomic, copy) NSString *createTime; //用户下发测量计划时间,手机的时间
@property(nonatomic, assign) int64_t saveTime; //保存时间
@end
