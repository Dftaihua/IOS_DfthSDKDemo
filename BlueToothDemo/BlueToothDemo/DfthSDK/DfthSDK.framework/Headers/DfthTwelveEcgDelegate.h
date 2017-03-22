//
//  DfthTwelveEcgDelegate.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/7.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthSingleEcgDelegate.h"

@protocol DfthTwelveEcgDelegate <DfthSingleEcgDelegate>
- (void)handleSSCActived;
- (void)handleSSCCanceled;
@end
