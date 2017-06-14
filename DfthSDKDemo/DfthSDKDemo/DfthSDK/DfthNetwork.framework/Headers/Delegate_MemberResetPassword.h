//
//  Delegate_MemberResetPassword.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MemberResetPassword.h"

@protocol Delegate_MemberResetPassword <NSObject>
- (void)memberResetPasswordResult:(DfthNetResult *)result response:(Response_MemberResetPassword *)response;
@end

