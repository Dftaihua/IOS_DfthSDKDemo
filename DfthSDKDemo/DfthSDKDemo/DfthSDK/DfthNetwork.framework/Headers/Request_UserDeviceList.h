//
//  Request_userDeviceList.h
//  DfthNetwork
//
//  Created by admin on 2017/6/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_UserDeviceList : NSObject

@property(nonatomic, copy) NSString *mid;


- (instancetype)initWithMid:(NSString *)mid;

@end
