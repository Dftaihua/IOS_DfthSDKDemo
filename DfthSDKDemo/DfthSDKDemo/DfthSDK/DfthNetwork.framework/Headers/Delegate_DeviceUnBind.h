//
//  Delegate_DeviceUnBind.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_DeviceUnBind.h"
@protocol Delegate_DeviceUnBind <NSObject>

- (void)deviceUnBindResult:(DfthNetResult *)result response:(Response_DeviceUnBind *)response;

@end
