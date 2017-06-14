//
//  Delegate_AccessToken.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_AccessToken.h"

@protocol Delegate_AccessToken <NSObject>
- (void)accessTokenResult:(DfthNetResult *)result response:(Response_AccessToken *)response;
@end
