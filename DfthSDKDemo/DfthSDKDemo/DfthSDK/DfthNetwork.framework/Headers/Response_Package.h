//
//  Response_Package.h
//  DfthNetwork
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_Package : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *code;     //编码
@property (nonatomic, copy) NSString *name;     //套餐资费名称
@property (nonatomic, copy) NSString *desc;     //套餐资费描述
@property (nonatomic, strong) NSNumber *price;  //套餐单价
@property (nonatomic, copy) NSString *type;     //套餐类型
@property (nonatomic, copy) NSString *category; //类别：（0：全产品，1、单导，2、十二导）
@property (nonatomic, copy) NSString *brand;    //品牌
@property (nonatomic, copy) NSString *isExists; //是否已经领取
@end
