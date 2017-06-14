//
//  Delegate_GetFreePackages.h
//  DfthNetwork
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_Package.h"

@protocol Delegate_GetFreePackages <NSObject>
- (void)getFreePackages:(DfthNetResult *)result response:(NSMutableArray<Response_Package *> *)response;
@end
