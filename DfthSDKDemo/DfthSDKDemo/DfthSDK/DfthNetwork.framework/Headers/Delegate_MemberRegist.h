//
//  Delegate_MemberRegist.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MemberRegist.h"

@protocol Delegate_MemberRegist <NSObject>
- (void)memberRegistResult:(DfthNetResult *)result response:(Response_MemberRegist *)response;
@end
