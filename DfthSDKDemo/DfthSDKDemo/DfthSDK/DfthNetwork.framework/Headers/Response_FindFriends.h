//
//  Response_FindFriends.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_FindFriends : NSObject


@property(nonatomic, copy) NSString *id;
@property(nonatomic, assign) long saveTime;
@property(nonatomic, assign) long confirmTime;
@property(nonatomic, copy) NSString *mid;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *nickName;
@property(nonatomic, assign) NSInteger gender;
@property(nonatomic, assign) long birthday;
@property(nonatomic, copy) NSString *picture;
@property(nonatomic, copy) NSString *telNumber;

@end
