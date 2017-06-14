//
//  Response_RegistCooperatorUser.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_RegistCooperatorUser : NSObject
@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *appid;
@property (nonatomic, copy) NSString *blood;
@property (nonatomic, copy) NSString *credentialsNumber;
@property (nonatomic, copy) NSString *credentialsType;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *kindredName;
@property (nonatomic, copy) NSString *kindredNumber;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nation;
@property (nonatomic, copy) NSString *nfcCardNo;
@property (nonatomic, copy) NSString *telNumber;
@property (nonatomic, assign) int gender;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int mType;
@property (nonatomic, assign) int weight;
@property (nonatomic, assign) int zone;
@end
