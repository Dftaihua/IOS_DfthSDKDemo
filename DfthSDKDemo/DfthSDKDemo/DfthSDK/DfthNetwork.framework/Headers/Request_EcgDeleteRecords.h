//
//  Request_EcgDeleteRecords.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/6/29.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_EcgDeleteRecords : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, strong) NSArray<NSString*> *recordIds;
- (instancetype)initWithUserId:(NSString *)userId records:(NSArray<NSString *> *)records;
@end
