//
//  Request_EcgMeasureHistory.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_EcgMeasureHistory : NSObject
@property (nonatomic, assign) int64_t measureBeginTime;
@property (nonatomic, assign) int64_t measureEndTime;
@property (nonatomic, assign) int pageNum;
@property (nonatomic, assign) int pageSize;
@property (nonatomic, assign) int line;
@property (nonatomic, copy) NSString *sort;

- (instancetype)initWithStartTime:(int64_t)startTime endTime:(int64_t)endTime pageIndex:(int)pageIndex pageSize:(int)pageSize leadCount:(int)leadCount sortBy:(NSString *)sort;
@end

@interface Request_EcgMeasureHistory : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, strong) Real_EcgMeasureHistory *request;

- (instancetype)initWithUserId:(NSString *)userId startTime:(int64_t)startTime endTime:(int64_t)endTime pageIndex:(int)pageIndex pageSize:(int)pageSize leadCount:(int)leadCount sortBy:(NSString *)sort;
@end
