//
//  DfthUser.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

NS_ASSUME_NONNULL_BEGIN
@interface DfthUser : NSObject
@property (nonatomic, assign) int64_t birthday;
@property (nonatomic, assign) int64_t createTime;
@property (nonatomic, assign) int credentialsType;
@property (nonatomic, assign) int gender;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int mType;
@property (nonatomic, assign) int userZone;
@property (nonatomic, assign) int weight;
@property (nonatomic, assign) int64_t currentPlanCreateTime;

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

@property(nonatomic, strong) NSArray<Habit*> *habits;
@property(nonatomic, strong) NSArray<Disease*> *diseases;
@property(nonatomic, copy) NSString *consRecord;
@property(nonatomic, copy) NSString *serviceInfo;

- (instancetype)initWithName:(NSString *)name telephone:(NSString *)telephone birthday:(int64_t)birthday gender:(int)gender;
- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password;
- (_Nonnull instancetype)initWith:(User * _Nonnull )user;

@end
NS_ASSUME_NONNULL_END
