//
//  Request_EcgCreateRecord.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "DfthEcgRecord.h"

@interface Real_EcgCreateRecord : NSObject
@property(nonatomic, assign) int line;
@property(nonatomic, assign) int64_t measuringBegin;
@property(nonatomic, copy) NSString *appid;
@property(nonatomic, copy) NSString *mac;

#ifndef ZONE_DEV
@property (nonatomic, strong) NSString *isExperience;
@property (nonatomic, strong) NSString *timeZone;
#endif
@end

@interface Request_EcgCreateRecord : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, strong) Real_EcgCreateRecord *requst;
@end
