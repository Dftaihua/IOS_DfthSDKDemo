//
//  Delegate_BpGetPlan.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_BpGetPlan.h"

@protocol Delegate_BpGetPlan <NSObject>
- (void)bpGetPlanResult:(DfthNetResult *)result response:(Response_BpGetPlan *)response;
@end
