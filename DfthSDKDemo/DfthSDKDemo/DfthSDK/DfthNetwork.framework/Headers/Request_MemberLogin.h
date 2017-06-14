//
//  Request_MemberLogin.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_MemberLogin : NSObject
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;
- (instancetype)initWith:(NSString *)account password:(NSString *)password;
@end
