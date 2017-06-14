//
//  Request_BpCreateRecords.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/21.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BpRecord.h"


@interface Request_BpCreateRecords : NSObject
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, strong) NSMutableArray<BpRecord*> *request;
@end
