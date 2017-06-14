//
//  Delegate_EcgCreateRecord.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_EcgCreateRecord.h"

@protocol Delegate_EcgCreateRecord <NSObject>
- (void)ecgCreateRecordResult:(DfthNetResult *)result response:(Response_EcgCreateRecord *)response;
@end
