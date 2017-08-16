//
//  Request_ApplyFriend.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_ApplyFriend : NSObject

@property(nonatomic, copy) NSString *mid; // 申请人id

@property(nonatomic, copy) NSString *mid2; // 被申请人id

@property(nonatomic, copy) NSString *remark; // 申请信息

- (instancetype)initWithMid:(NSString *)mid mid2:(NSString *)mid2 remark:(NSString *)remark;

@end
