//
//  DfthDeviceStateDelegate.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DfthDeviceStateDelegate <NSObject>
- (void)stateChangeFrom:(NSString *)previousState to:(NSString *)currentState;
@end
