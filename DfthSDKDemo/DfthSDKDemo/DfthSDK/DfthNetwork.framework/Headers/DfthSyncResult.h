//
//  DfthSyncResult.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthNetResult.h"

@interface DfthSyncResult : NSObject
@property (nonatomic, strong) DfthNetResult *netResult;
@property (nonatomic, strong) __kindof NSObject *response;

@end
