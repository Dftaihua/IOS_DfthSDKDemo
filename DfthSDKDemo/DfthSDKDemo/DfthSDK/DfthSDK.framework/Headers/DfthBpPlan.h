//
//  DfthBpPlan.h
//  MyBluetooth
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthBpPlanResult.h"

@class BpPlan;

#define DAY_LONG (16*60*60)
#define NIGHT_LONG (8*60*60)
#define MAX_SCHEDULE_COUNT 41

typedef NS_ENUM(NSUInteger, BpPlanState) {
    PS_Created = 0,
    PS_Finished,
    PS_RecordCreated,
    PS_AnalyseResultGot,
    PS_TaskCreated,
    PS_InvalidPlan,
};

@interface DfthBpPlan : NSObject{
    short _schedules[MAX_SCHEDULE_COUNT];
}

@property(nonatomic, assign) int64_t createTime;   //单位秒
@property(nonatomic, assign) int64_t measureBeginTime;   //单位秒
@property(nonatomic, assign) int64_t measureEndTime;   //单位秒
@property(nonatomic, assign) int64_t alarmTime;
@property(nonatomic, assign) int totalCount;
@property(nonatomic, assign) int currentIndex;
@property(nonatomic, assign) int dayCount;
@property(nonatomic, assign) int nightCount;
@property(nonatomic, assign) int dayInterval;
@property(nonatomic, assign) int nightInterval;

@property(nonatomic, assign) BpPlanState state;
@property(nonatomic, copy) NSString *planId;
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *deviceMac;
@property(nonatomic, copy) NSString *appId;

@property(nonatomic, strong) DfthBpPlanResult *planResult;

- (instancetype)initWithDayInterval:(int)dayInterval nightInterval:(int)nightInterval alarmTime:(int64_t)alarmTime appId:(NSString *)appId userId:(NSString *)userId deviceMac:(NSString *)deviceMac;

- (instancetype)initWithDayInterval:(int)dayInterval nightInterval:(int)nightInterval alarmTime:(int64_t)alarmTime appId:(NSString *)appId userId:(NSString *)userId deviceMac:(NSString *)deviceMac createTime:(NSDate *)createTime;

- (instancetype)initWithTotalCount:(int)total currentIndex:(int)index alarmTime:(int64_t)alarmTime createTime:(int64_t)createTime schedules:(short *)schedules;
- (instancetype)initWith:(BpPlan *)bpPlan;

- (short *)getSchedules;

- (void)makePlanFinish;
- (NSString *)jsonString;
@end
