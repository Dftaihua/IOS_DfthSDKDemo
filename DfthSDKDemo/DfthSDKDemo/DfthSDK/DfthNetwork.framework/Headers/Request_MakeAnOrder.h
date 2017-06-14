//
//  Request_MakeAnOrder.h
//  DfthNetwork
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject
@property (nonatomic, copy) NSString *saleProdType;     //销售品类型
@property (nonatomic, copy) NSString *saleProdCode;     //销售品Code
@property (nonatomic, strong) NSNumber *quantity;         //订购数量
@end

@interface Request_MakeAnOrder : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, strong) NSMutableArray<Order *> *list;
@end
