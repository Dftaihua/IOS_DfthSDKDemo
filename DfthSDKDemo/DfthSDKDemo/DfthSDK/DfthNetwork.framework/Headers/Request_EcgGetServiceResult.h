//
//  Request_EcgGetServiceResult.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/20.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_EcgGetServiceResult : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *recordId;

-(instancetype)initWithUserId:(NSString *)userId recordId:(NSString *)recordId;
@end
