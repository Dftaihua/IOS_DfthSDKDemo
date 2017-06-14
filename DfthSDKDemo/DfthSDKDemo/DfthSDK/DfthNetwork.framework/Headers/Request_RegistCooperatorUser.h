//
//  Request_RegistCooperatorUser.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_RegistCooperatorUser : NSObject
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int gender;
@property (nonatomic, copy) NSString *telNumber;
@end

@interface Request_RegistCooperatorUser : NSObject
@property (nonatomic, copy) NSString *orgId;
@property (nonatomic, strong) Real_RegistCooperatorUser *request;
@end
