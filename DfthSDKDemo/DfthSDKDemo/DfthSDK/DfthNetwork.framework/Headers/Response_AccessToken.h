//
//  Response_AccessToken.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_AccessToken : NSObject
@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, assign) int64_t expires_in;
@end
