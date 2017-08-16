//
//  Response_userDeviceList.h
//  DfthNetwork
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_UserDeviceList : NSObject

@property(nonatomic, copy) NSString *devType;

@property(nonatomic, copy) NSString *devVersion;

@property(nonatomic, assign) long bindTime;

@property(nonatomic, copy) NSString *macAddr;

@end
