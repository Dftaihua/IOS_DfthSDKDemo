//
//  DfthNetTask.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthSyncResult.h"

@interface DfthNetTask : NSObject
@property (nonatomic, assign) int timeout;

- (void)async;
- (void)cancel;
- (DfthSyncResult *)sync;

@end
