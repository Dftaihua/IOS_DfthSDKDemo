//
//  Request_DeviceUnBind.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_DeviceUnBind : NSObject

@property(nonatomic, copy) NSString *mid;
@property(nonatomic, copy) NSString *mac;

- (instancetype)initWithMid:(NSString *)mid mac:(NSString *)mac;


@end
