//
//  Request_FriendsCount.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_FriendsCount : NSObject

@property(nonatomic, copy) NSString *mid;


- (instancetype)initWithMid:(NSString *)mid;

@end
