//
//  Response_DeviceInfo.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_DeviceInfo : NSObject

@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *orgId;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *version;
@property(nonatomic, copy) NSString *macAddr;
@property(nonatomic, copy) NSString *state;
@property(nonatomic, assign) int createTime;
@property(nonatomic, assign) int updateTime;
@property(nonatomic, assign) NSString *batch;
@property(nonatomic, assign) NSString *modeType;
@property(nonatomic, assign) int activeTime;

@end
