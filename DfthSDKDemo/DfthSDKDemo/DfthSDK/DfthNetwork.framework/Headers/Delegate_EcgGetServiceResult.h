//
//  Delegate_EcgGetServiceResult.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/20.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EcgNetRecord.h"

@protocol Delegate_EcgGetServiceResult <NSObject>
- (void)ecgGetServiceResult:(DfthNetResult *)result response:(EcgNetRecord *)response;
@end
