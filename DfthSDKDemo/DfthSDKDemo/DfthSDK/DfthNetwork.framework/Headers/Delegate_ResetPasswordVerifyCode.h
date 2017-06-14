//
//  Delegate_ResetPasswordVerifyCode.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_ResetPasswordVerifyCode.h"

@protocol Delegate_ResetPasswordVerifyCode <NSObject>
- (void)resetPasswordVerifyCodeResult:(DfthNetResult *)result response:(Response_ResetPasswordVerifyCode *)response;
@end
