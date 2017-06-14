//
//  Request_BpCreatePlan.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_BpCreatePlan : NSObject
@property(nonatomic, assign) int64_t measuringBegin;
@property(nonatomic, assign) int64_t measuringEnd;
@property(nonatomic, assign) int dayInterval;
@property(nonatomic, assign) int nightInterval;
@property(nonatomic, assign) int64_t createTime;
//@property(nonatomic, assign) int measureCount;
@property(nonatomic, copy) NSString *appid;
//@property(nonatomic, copy) NSString *mac;
@end

@interface Request_BpCreatePlan : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, strong) Real_BpCreatePlan *request;
@end
