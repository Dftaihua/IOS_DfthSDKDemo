//
//  Request_getMember.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_getMember : NSObject


@property(nonatomic, copy) NSString *account;


- (instancetype)initWithAccount:(NSString *)account;

@end
