//
//  Request_CreateTask.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_CreateTask : NSObject
@property(nonatomic, assign) int dataType;
@property(nonatomic, copy) NSString *dataId;
- (instancetype) initWithDataId:(NSString *)dataId dataType:(int)dataType;

@end

@interface Request_CreateTask : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, strong) Real_CreateTask *request;

- (instancetype) initWithUserId:(NSString *)userId dataId:(NSString *)dataId dataType:(int)dataType;
@end

