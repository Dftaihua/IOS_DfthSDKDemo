//
//  Delegate_DeviceBinding.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_DeviceBinding.h"

@protocol Delegate_DeviceBinding <NSObject>

- (void)deviceBindResult:(DfthNetResult *)result response:(Response_DeviceBinding *)response;

@end
