//
//  Response_Oauth.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_Oauth : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *orgId;
@property (nonatomic, assign) int64_t exprie_time;
@end
