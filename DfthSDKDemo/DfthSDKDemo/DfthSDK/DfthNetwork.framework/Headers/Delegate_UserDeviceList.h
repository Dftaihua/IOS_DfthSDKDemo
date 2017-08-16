//
//  Delegate_UserDeviceList.h
//  DfthNetwork
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_UserDeviceList.h"

@protocol Delegate_UserDeviceList <NSObject>

- (void)userDeviceList:(DfthNetResult *)result response:(NSMutableArray<Response_UserDeviceList *>  *)response;


@end
