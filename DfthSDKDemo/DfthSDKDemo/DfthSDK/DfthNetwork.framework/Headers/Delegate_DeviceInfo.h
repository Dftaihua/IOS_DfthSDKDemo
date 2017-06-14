//
//  Delegate_DeviceInfo.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_DeviceInfo.h"

@protocol Delegate_DeviceInfo <NSObject>

- (void)deviceInfoResult:(DfthNetResult *)result response:(Response_DeviceInfo *)response;


@end
