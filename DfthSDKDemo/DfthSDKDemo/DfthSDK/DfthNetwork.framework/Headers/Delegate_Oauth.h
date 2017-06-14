//
//  Delegate_Oauth.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_Oauth.h"

@protocol Delegate_Oauth <NSObject>
- (void)oauthResult:(DfthNetResult *)result response:(Response_Oauth *)response;
@end
