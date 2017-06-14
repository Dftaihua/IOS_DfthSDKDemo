//
//  Delegate_FriendsList.h
//  DfthNetwork
//
//  Created by admin on 2017/5/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_FriendsList.h"

@protocol Delegate_FriendsList <NSObject>

- (void)friendsListResult:(DfthNetResult *)result response:(Response_FriendsList *)response;

@end
