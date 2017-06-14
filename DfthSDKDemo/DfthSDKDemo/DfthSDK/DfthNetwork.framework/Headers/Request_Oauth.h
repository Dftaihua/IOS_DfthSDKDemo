//
//  Request_Oauth.h
//  DfthNetwork
//
//  Created by yue gao on 2017/3/30.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_Oauth : NSObject
@property (nonatomic, copy) NSString *client_id;
@property (nonatomic, copy) NSString *response_type;    //@"code"
@property (nonatomic, copy) NSString *redirect_uri;     //@"http://none"
@end
