//
//  DfthNetResult.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, DfthNetCode)
{
    Net_Ok = 0,
    Net_Error,
    Net_NoNet,
    Net_ServiceError,
    Net_NOEcg,
};

@interface DfthNetPage : NSObject
@property (nonatomic, assign) int pageNum;
@property (nonatomic, assign) int pageSize;
@property (nonatomic, assign) int total;
@property (nonatomic, assign) int pages;
@end

@interface DfthNetResult : NSObject
@property (nonatomic, assign) int result;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) DfthNetPage *page;
//@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSObject *data;
@property (nonatomic, copy) NSString *errcode;


+(DfthNetResult *)defaultOk;
+(DfthNetResult *)defaultError;
+(DfthNetResult *)defaultNoNet;
+(DfthNetResult *)defaultServerError;

// 周素华add
+(DfthNetResult *)defaultNOEcg;

@end
