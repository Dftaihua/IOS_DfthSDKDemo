//
//  Delegate_MemberInfo.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MemberInfo.h"

@protocol Delegate_MemberInfo <NSObject>
- (void)memberInfoResult:(DfthNetResult *)result response:(Response_MemberInfo *)response;
@end
