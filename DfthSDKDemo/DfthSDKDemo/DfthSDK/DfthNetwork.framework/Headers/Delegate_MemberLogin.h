//
//  Delegate_MemberLogin.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MemberLogin.h"

@protocol Delegate_MemberLogin <NSObject>
- (void)memberLoginResult:(DfthNetResult *)result response:(Response_MemberLogin *)response;
@end
