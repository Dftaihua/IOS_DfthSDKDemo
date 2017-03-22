//
//  DfthDevice.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceInterface.h"

@interface DfthDevice : NSObject <DeviceInterface>
@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *mac;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) DfthDeviceType type;
@property(nonatomic, copy) NSString *version;
@property(nonatomic, assign) float battery;
@property(nonatomic, strong) NSMutableArray<id<DfthDeviceStateDelegate>> *stateDelegate;

//- (instancetype)initWithMac:(NSString*)mac name:(NSString*)name type:(DfthDeviceType)type version:(NSString*)version battery:(float)battery;
@end
