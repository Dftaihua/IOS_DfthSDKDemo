//
//  Request_MemberUpdate.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_MemberUpdate : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nation;
@property (nonatomic, copy) NSString *blood;
@property (nonatomic, copy) NSString *telNumber;
@property (nonatomic, copy) NSString *kindredNumber;
@property (nonatomic, copy) NSString *kindredName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *nfcCardNo;
@property (nonatomic, assign) int gender;
@property (nonatomic, assign) int64_t birthday;    //单位毫秒？
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int weight;
@property (nonatomic, assign) int64_t createTime;
@end
