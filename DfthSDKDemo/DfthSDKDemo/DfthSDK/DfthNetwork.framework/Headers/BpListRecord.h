//
//  BpListRecord.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BpListRecord : NSObject
@property (nonatomic, copy) NSString *id;   //血压id
@property (nonatomic, copy) NSString *mId;  //用户id
@property (nonatomic, assign) int systolic;  //高压
@property (nonatomic, assign) int diastolic;  //低压
@property (nonatomic, assign) int pulseRate;  //脉率
@property (nonatomic, assign) int measureMode;   //测量方式[-1：手动，1：自动，2：录入，]
@property (nonatomic, assign) int64_t measuringTime;
@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *mac;
@property (nonatomic, strong) NSString *isExperience;
@property (nonatomic, strong) NSString *timeZone;
@end
