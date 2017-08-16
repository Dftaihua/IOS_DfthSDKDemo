//
//  Delegate_getMember.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Response_getMember.h"

@protocol Delegate_getMember <NSObject>

- (void)getMemberResult:(DfthNetResult *)result response:(Response_getMember *)response;


@end
