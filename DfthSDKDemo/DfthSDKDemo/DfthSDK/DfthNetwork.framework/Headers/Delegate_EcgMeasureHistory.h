//
//  Delegate_EcgMeasureHistory.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EcgNetRecord.h"

@protocol Delegate_EcgMeasureHistory <NSObject>
- (void)ecgMeasureHistoryResult:(DfthNetResult *)result response:(NSArray<EcgNetRecord*> *)response;
@end
