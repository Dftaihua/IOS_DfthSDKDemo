//
//  DfthTask.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/24.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DfthTask : NSObject
@property(nonatomic, assign) NSTimeInterval timeout;

//-(id)sync;
- (void)async;
- (void)cancel;
@end
