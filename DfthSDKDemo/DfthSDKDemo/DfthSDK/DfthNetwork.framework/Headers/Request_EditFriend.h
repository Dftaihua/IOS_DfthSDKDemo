//
//  Request_EditFriend.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_EditFriend : NSObject

@property(nonatomic, copy) NSString *mid;// 亲友会员id
@property(nonatomic, copy) NSString *nickName; //
//@property(nonatomic, copy) NSString *status; // 1:申请通过；2：申请不通过；3：取消关注；

@end

@interface Request_EditFriend : NSObject

//@property(nonatomic, copy) NSString *mid;// 亲友会员id

@property(nonatomic, copy) NSString *id; // 申请记录id

@property(nonatomic, strong)Real_EditFriend *editFriend;
//@property(nonatomic, copy) NSString *nickname; //

- (instancetype)initWithid:(NSString *)id mid:(NSString *)mid nickname:(NSString *)nickname;

@end
