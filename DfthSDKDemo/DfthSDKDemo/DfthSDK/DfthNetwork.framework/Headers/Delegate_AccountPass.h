//
//  Delegate_AccountPass.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/7/12.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_AccountPass.h"

@protocol Delegate_AccountPassword <NSObject>
- (void)AccountPasswordResult:(DfthNetResult *)result response:(Response_AccountPass *)response;
@end
