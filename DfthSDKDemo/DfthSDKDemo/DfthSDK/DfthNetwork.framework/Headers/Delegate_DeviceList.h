//
//  Delegate_DeviceList.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_DeviceList.h"

@protocol Delegate_DeviceList <NSObject>

- (void)deviceListResult:(DfthNetResult *)result response:(NSMutableArray<Response_DeviceList *>  *)response;


@end
