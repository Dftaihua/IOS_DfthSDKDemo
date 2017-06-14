//
//  DfthSDKManager+Friends.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (Friends)
+ (DfthTask *)getFriendsListTaskWith:(NSString *)userId completeHandler:(FriendsListBlock)handler;
@end
