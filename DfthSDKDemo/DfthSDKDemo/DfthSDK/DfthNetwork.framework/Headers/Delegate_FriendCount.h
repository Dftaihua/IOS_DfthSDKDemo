//
//  Delegate_FriendCount.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Response_FriendsCount.h"

@protocol Delegate_FriendCount <NSObject>


- (void)friendCountResult:(DfthNetResult *)result response:(Response_FriendsCount *)response;


@end
