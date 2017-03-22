//
//  DfthUser.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface DfthUser : NSObject
@property (nonatomic, assign) int birthday;
@property (nonatomic, assign) int createTime;
@property (nonatomic, assign) int credentialsType;
@property (nonatomic, assign) int gender;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int mType;
@property (nonatomic, assign) int userZone;
@property (nonatomic, assign) int weight;
@property (nonatomic, assign) long currentPlanCreateTime;

@property (nullable, nonatomic, copy) NSString *blood;
@property (nullable, nonatomic, copy) NSString *credentialsNumber;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *kindredName;
@property (nullable, nonatomic, copy) NSString *kindredNumber;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *nation;
@property (nullable, nonatomic, copy) NSString *nfcCardNo;
@property (nullable, nonatomic, copy) NSString *telNumber;
@property (nullable, nonatomic, copy) NSString *userId;
@property (nullable, nonatomic, copy) NSString *account;
@property (nullable, nonatomic, copy) NSString *password;

- (_Nonnull instancetype)initWith:(User * _Nonnull )user;

@end
