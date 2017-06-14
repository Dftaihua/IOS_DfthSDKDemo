//
//  Response_DeviceList.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_DeviceList : NSObject


@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *macAddr;
@property(nonatomic, copy) NSString *devId;
@property(nonatomic, copy) NSString *mId;
@property(nonatomic, copy) NSString *useTime;
@property(nonatomic, copy) NSString *useAddrProvince;
@property(nonatomic, copy) NSString *useAddrCity;
@property(nonatomic, assign) int bindTime;
@property(nonatomic, assign) int unbindTime;
@property(nonatomic, assign) NSString *status;


@end
