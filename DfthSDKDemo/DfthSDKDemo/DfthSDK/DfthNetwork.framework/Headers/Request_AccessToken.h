//
//  Request_AccessToken.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/31.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_AccessToken : NSObject
@property (nonatomic, copy) NSString *client_id;
@property (nonatomic, copy) NSString *client_secret;    
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *grant_type;       //@"authorization_code"
@property (nonatomic, copy) NSString *redirect_uri;     //@"http://none"

@end
