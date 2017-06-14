//
//  Delegate_BpCreatePlan.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_BpCreatePlan.h"

@protocol Delegate_BpCreatePlan <NSObject>
- (void)bpCreatePlanResult:(DfthNetResult *)result response:(Response_BpCreatePlan *)response;
@end
