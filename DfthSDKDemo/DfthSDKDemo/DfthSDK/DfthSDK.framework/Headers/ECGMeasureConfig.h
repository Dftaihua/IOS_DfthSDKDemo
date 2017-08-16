//
//  ECGMeasureConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface ECGMeasureConfig : BaseArchiveObject
@property(nonatomic, assign) long trialMeasureLength;//体验测量时长,单位毫秒
@property(nonatomic, assign) BOOL disconnectReconnect;//心电测量断开重连
@end
