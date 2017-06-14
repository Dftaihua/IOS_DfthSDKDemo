//
//  Delegate_EcgUpdateAnalyseResult.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_EcgUpdateAnalyseResult.h"

@protocol Delegate_EcgUpdateAnalyseResult <NSObject>
- (void)ecgUpdateAnalyseResult:(DfthNetResult *)result response:(Response_EcgUpdateAnalyseResult *)response;
@end
