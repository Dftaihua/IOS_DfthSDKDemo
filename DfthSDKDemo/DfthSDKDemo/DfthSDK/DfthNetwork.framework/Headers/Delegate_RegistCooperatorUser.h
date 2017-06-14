//
//  Delegate_RegistCooperatorUser.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_RegistCooperatorUser.h"

@protocol Delegate_RegistCooperatorUser <NSObject>
- (void)registCooperatorUserResult:(DfthNetResult *)result response:(Response_RegistCooperatorUser *)response;
@end
