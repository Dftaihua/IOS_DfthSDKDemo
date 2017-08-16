//
//  BpRecord.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/21.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BpRecord : NSObject
@property(nonatomic, assign) int systolic;
@property(nonatomic, assign) int diastolic;
@property(nonatomic, assign) int pulseRate;
@property(nonatomic, assign) int64_t measuringTime;
@property(nonatomic, assign) int measureMode;
@property(nonatomic, copy) NSString *mac;
@property(nonatomic, copy) NSString *appid;
#ifndef ZONE_DEV
@property (nonatomic, strong) NSString *isExperience;
@property (nonatomic, strong) NSString *timeZone;
#endif
@end
