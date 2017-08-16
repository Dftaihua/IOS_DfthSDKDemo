//
//  DfthBpPlan+SDK.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthDB/DfthDB.h>

@interface DfthBpPlan (SDK)
- (void)getValueFromNetworkResponse:(Response_BpGetPlan *)response;
- (void)makePlanFinish;
@end
