//
//  DfthDevice.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceInterface.h"
#import "State.h"

@interface DfthDevice : NSObject <State, DeviceInterface>
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *mac;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) DfthDeviceType type;
@property(nonatomic, copy) NSString *version;
@property(nonatomic, assign) float battery;
@property(nonatomic, assign, getter=isConnected) BOOL connected;
@property(nonatomic, assign, getter=isMeasuring) BOOL measuring;
@property(nonatomic, strong) NSMutableArray<id<DfthDeviceStateDelegate>> *stateDelegate;


@end
