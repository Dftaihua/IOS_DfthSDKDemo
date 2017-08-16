//
//  Request_AccountPass.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/7/12.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_AccountPass : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *oldPassword;
@property (nonatomic, copy) NSString *secondPassword;
@end
