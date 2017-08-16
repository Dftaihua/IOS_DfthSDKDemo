//
//  AmbpsNibpsRecord.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AmbpsNibpsRecord : NSObject
@property (nonatomic, copy) NSString *id;     //血压id
@property (nonatomic, copy) NSString *mId;    //用户id
@property (nonatomic, assign) int systolic;   //收缩压(高压)
@property (nonatomic, assign) int diastolic;   //舒张压(低压)
@property (nonatomic, assign) int pulseRate;   //脉率
@property (nonatomic, assign) int measureMode;   //测量方式[-1：手动，1：自动，2：录入，]
@property (nonatomic, assign) int64_t measuringTime;   //测量时间
@property (nonatomic, copy) NSString *appid;     //来源appid
@property (nonatomic, copy) NSString *mac;     //设备mac地址
@property (nonatomic, copy) NSString *isExperience;     //是否体验测量
@property (nonatomic, copy) NSString *timeZone;     //时区
@end
