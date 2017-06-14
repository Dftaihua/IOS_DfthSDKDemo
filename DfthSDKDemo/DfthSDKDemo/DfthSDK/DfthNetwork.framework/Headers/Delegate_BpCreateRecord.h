//
//  Delegate_BpCreateRecord.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_BpCreateRecord.h"

@protocol Delegate_BpCreateRecord <NSObject>
- (void)bpCreateRecordResult:(DfthNetResult *)result response:(Response_BpCreateRecord *)response;
@end
