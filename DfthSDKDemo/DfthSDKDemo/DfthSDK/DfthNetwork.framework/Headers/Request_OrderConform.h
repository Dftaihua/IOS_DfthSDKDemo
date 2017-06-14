//
//  Request_OrderConform.h
//  DfthNetwork
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_OrderConform : NSObject
@property (nonatomic, copy) NSString *orderNo;     //订单号

- (instancetype)initWithOrderNo:(NSString *)orderNo;
@end
