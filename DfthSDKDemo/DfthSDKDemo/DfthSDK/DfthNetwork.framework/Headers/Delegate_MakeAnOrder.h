//
//  Delegate_MakeAnOrder.h
//  DfthNetwork
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_MakeAnOrder.h"

@protocol Delegate_MakeAnOrder <NSObject>
- (void)makeAnOrder:(DfthNetResult *)result response:(Response_MakeAnOrder *)response;
@end
