//
//  Request_DeviceInfo.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_DeviceInfo : NSObject


@property (nonatomic, copy) NSString *mac;

- (instancetype)initWith:(NSString *)mac;


@end
