//
//  Request_DiseaseUpdate.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Disease.h"

@interface Request_DiseaseUpdate : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, strong) NSArray<Disease*> *request;

- (instancetype)initWithUserId:(NSString *)userId diseases:(NSArray<Disease*> *)diseases;
@end
