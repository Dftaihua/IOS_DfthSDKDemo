//
//  DfthTwelveEcgDevice.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/4.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "DfthSingleEcgDevice.h"


@interface DfthTwelveEcgDevice : DfthSingleEcgDevice
@property(nonatomic, assign) EcgSSCState SSC;  // 0为取消 1为开始
@end
