//
//  Delegate_CreateTask.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_CreateTask.h"

@protocol Delegate_CreateTask <NSObject>
- (void)createTaskResult:(DfthNetResult *)result response:(Response_CreateTask *)response;
@end
