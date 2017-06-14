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

/**
 * 用户激活SSC任务
 *
 */
- (void)handleSSCActived;

/**
 * 用户取消SSC任务
 *
 */
- (void)handleSSCCanceled;
@end
