//
//  Delegate_NibpsList.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BpListRecord.h"

@protocol Delegate_NibpsList <NSObject>
- (void)nibpsListResult:(DfthNetResult *)result response:(NSArray<BpListRecord*> *)response;
@end

