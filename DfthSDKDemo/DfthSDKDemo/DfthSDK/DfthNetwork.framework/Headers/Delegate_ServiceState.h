//
//  Delegate_ServiceState.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_ServiceState.h"

@protocol Delegate_ServiceState <NSObject>
- (void)serviceStateResult:(DfthNetResult *)result response:(Response_ServiceState *)response;
@end
