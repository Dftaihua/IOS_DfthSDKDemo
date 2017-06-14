//
//  Request_GetFreePackages.h
//  DfthNetwork
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_GetFreePackages : NSObject
@property (nonatomic, copy) NSString *userId;

-(instancetype)initWithUserId:(NSString *)userId;
@end
