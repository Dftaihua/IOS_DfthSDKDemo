//
//  Delegate_FindFriends.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Response_FindFriends.h"

@protocol Delegate_FindFriends <NSObject>

- (void)findFriendsResult:(DfthNetResult *)result response:(NSMutableArray<Response_FindFriends *>  *)response;

@end
