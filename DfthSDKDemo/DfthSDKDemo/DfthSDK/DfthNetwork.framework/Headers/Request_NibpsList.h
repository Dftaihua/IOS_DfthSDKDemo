//
//  Request_NibpsList.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_NibpList : NSObject
@property (nonatomic, assign) int64_t measureBeginTime; //单位为毫秒
@property (nonatomic, assign) int64_t measureEndTime;
@property (nonatomic, assign) int pageNum;
@property (nonatomic, assign) int pageSize;
@property (nonatomic, copy) NSString *sort;

- (instancetype)initWithStartTime:(int64_t)startTime endTime:(int64_t)endTime pageIndex:(int)pageIndex pageSize:(int)pageSize sortBy:(NSString *)sort;
@end


@interface Request_NibpsList : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, strong) Real_NibpList *request;

- (instancetype)initWithUserId:(NSString *)userId startTime:(int64_t)startTime endTime:(int64_t)endTime pageIndex:(int)pageIndex pageSize:(int)pageSize sortBy:(NSString *)sort;

@end
