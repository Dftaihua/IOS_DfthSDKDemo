//
//  Delegate_FindApplyList.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Response_FindApplyList.h"

@protocol Delegate_FindApplyList <NSObject>


- (void)findApplyListResult:(DfthNetResult *)result response:(NSMutableArray<Response_FindApplyList *>  *)response;

@end
