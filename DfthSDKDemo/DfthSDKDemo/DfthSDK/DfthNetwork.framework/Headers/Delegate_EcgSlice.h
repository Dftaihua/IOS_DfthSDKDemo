//
//  Delegate_EcgSlice.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_EcgSlice.h"

@protocol Delegate_EcgSlice <NSObject>
- (void)ecgSliceWithDataResult:(DfthNetResult *)result response:(Response_EcgSlice *)response;
@end
