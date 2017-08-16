//
//  Delegate_AmbpsList.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_BpGetPlan.h"

@protocol Delegate_AmbpsList <NSObject>
- (void)ambpsListResult:(DfthNetResult *)result response:(NSArray<Response_BpGetPlan*> *)response;
@end
