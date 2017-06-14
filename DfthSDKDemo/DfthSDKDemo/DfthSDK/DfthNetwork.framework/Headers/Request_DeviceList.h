//
//  Request_DeviceList.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_DeviceList : NSObject

@property (nonatomic, copy) NSString *mac;

- (instancetype)initWithMac:(NSString *)mac;

@end
