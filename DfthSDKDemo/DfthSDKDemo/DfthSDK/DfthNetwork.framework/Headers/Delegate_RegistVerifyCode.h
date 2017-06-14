//
//  Delegate_RegistVerifyCode.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_RegistVerifyCode.h"

@protocol Delegate_RegistVerifyCode <NSObject>
- (void)registVerifyCodeResult:(DfthNetResult *)result response:(Response_RegistVerifyCode *)response;
@end

