//
//  DfthTask.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/24.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NEVER -1

@interface DfthTask : NSObject
@property(nonatomic, assign) int timeout;
@property(atomic, assign, getter=isRunning) BOOL running;

//-(id)sync;
- (void)async;
- (void)cancel;
@end
