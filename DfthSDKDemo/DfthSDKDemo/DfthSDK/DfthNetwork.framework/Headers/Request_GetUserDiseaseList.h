//
//  Request_GetUserDiseaseList.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_GetUserDiseaseList : NSObject

@property (nonatomic, copy) NSString *userId;

- (instancetype)initWithUserId:(NSString *)userId;
@end
