//
//  Request_FindFriends.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_FindFriends : NSObject

@property(nonatomic, copy) NSString *mid; // 会员id

@property(nonatomic, copy) NSString *status; // 状态，0：待确认；1:申请通过；2：申请不通过；3：取消关注；


- (instancetype)initWithMid:(NSString *)mid status:(NSString *)status;


@end
