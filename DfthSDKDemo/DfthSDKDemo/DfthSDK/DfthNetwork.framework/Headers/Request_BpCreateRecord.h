//
//  Request_BpCreateRecord.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BpRecord.h"

@interface Request_BpCreateRecord : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, strong) BpRecord *request;
@end

