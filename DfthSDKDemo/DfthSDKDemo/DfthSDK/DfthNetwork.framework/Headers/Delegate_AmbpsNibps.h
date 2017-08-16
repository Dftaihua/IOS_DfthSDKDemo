//
//  Delegate_AmbpsNibps.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AmbpsNibpsRecord.h"

@protocol Delegate_AmbpsNibps <NSObject>
- (void)ambpsNibpsResult:(DfthNetResult *)result response:(NSArray<AmbpsNibpsRecord*> *)response;
@end
