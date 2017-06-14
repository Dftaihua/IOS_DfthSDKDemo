//
//  State.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol State <NSObject>
- (void)connect;
- (void)connectSucceeded;
- (void)connectFailed;

- (void)startMeasure;
- (void)startMeasureSucceeded;
- (void)startMeasureFailed;

- (void)stopMeasure;
- (void)stopMeasureSucceeded;
- (void)stopMeasureFailed;

- (void)disconnect;
- (void)disconnectSucceeded;
- (void)disconnectFailed;
- (void)disconnectByDevice;

- (void)analyseComplete;

@end
