//
//  Request_MemberLoginByVerifyCode.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/7/6.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_MemberLoginByVerifyCode : NSObject
@property (nonatomic, copy) NSString *appid;	//Client_id
@property (nonatomic, copy) NSString *phone;	//电话号码
@property (nonatomic, copy) NSString *veriCode;	//验证码
@property (nonatomic, copy) NSString *orgid;


- (instancetype)initWithTelphone:(NSString *)phone verifyCode:(NSString *)verifyCode appId:(NSString *)appId orgId:(NSString *)orgId;
@end
