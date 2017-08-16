//
//  Request_DeviceBinding.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_DeviceBinding : NSObject


@property(nonatomic, copy) NSString *mId;
@property(nonatomic, copy) NSString *devType;
@property(nonatomic, copy) NSString *devVersion;
@property(nonatomic, copy) NSString *macAddr;
@property(nonatomic, copy) NSString *bindTime;
@property(nonatomic, assign) int useTime;
@property(nonatomic, copy) NSString *useAddrProvince;
@property(nonatomic, copy) NSString *useAddrCity;



- (instancetype)initWithMId:(NSString *)mId devType:(NSString *)devType devVersion:(NSString *)devVersion macAddr:(NSString *)macAddr bindTime:(NSString *)bindTime useTime:(int)useTime useAddrProvince:(NSString *)useAddrProvince useAddrCity:(NSString *)useAddrCity;



@end
