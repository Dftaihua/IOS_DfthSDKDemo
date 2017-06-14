//
//  Delegate_MemberUpdate.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MemberUpdate.h"

@protocol Delegate_MemberUpdate <NSObject>
- (void)memberUpdateResult:(DfthNetResult *)result response:(Response_MemberUpdate *)response;
@end
