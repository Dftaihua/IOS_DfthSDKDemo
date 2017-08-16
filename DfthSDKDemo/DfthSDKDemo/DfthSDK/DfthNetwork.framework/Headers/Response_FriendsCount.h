//
//  Response_FriendsCount.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_FriendsCount : NSObject

@property(nonatomic, assign) int haveCount;// 已有亲友数量
@property(nonatomic, assign) int count; // 亲友上限数量

@end
