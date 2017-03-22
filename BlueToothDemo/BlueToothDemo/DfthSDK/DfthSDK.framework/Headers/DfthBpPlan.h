//
//  DfthBpPlan.h
//  MyBluetooth
//
//  Created by admin on 2016/12/6.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BpPlan;

#define DAY_LONG (16*60*60)
#define NIGHT_LONG (8*60*60)
#define MAX_SCHEDULE_COUNT 100

typedef NS_ENUM(NSUInteger, BpPlanState) {
    PS_Created = 0,
    PS_Finished,
    PS_Uploaded,
};

@interface DfthBpPlan : NSObject{
    short _schedules[MAX_SCHEDULE_COUNT];
}

@property(nonatomic, assign) long createTime;
@property(nonatomic, assign) long finishTime;
@property(nonatomic, assign) int alarmTime;
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

- (instancetype)initWithDayInterval:(int)dayInterval nightInterval:(int)nightInterval alarmTime:(int)alarmTime;
- (instancetype)initWithTotalCount:(int)total currentIndex:(int)index alarmTime:(int)alarmTime createTime:(long)createTime schedules:(short *)schedules;
- (instancetype)initWith:(BpPlan *)bpPlan;

- (short *)getSchedules;

@end
