//
//  Request_ApplyResult.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Real_ApplyResult : NSObject
@property(nonatomic, copy) NSString *status; // 1:申请通过；2：申请不通过；3：取消关注；
@end
@interface Request_ApplyResult : NSObject

@property(nonatomic, copy) NSString *id;
@property(nonatomic, strong) Real_ApplyResult *realRequest; // 1:申请通过；2：申请不通过；3：取消关注；


- (instancetype)initWithid:(NSString *)id status:(NSString *)status;

@end
