//
//  Delegate_MemberLoginByVerifyCode.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/7/6.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Delegate_MemberLoginByVerifyCode <NSObject>
- (void)memberLoginByVerifyCodeResult:(DfthNetResult *)result userId:(NSString *)userId;
@end
