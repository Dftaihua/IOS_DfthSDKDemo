//
//  DfthSDKManager+Friends.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (Friends)
/**
 *查询亲友设定上线及现有亲友数量
 *
 * @param userId 用户id
 * @return DfthTask
 */
+ (DfthTask *)getFriendCountTaskWith:(NSString *)userId completeHandler:(FriendCountBlock)handler;

/**
 * 查询会员
 *
 * @param account 用户id
 *
 * @return DfthTask
 */
+ (DfthTask *)getmemberTaskWith:(NSString *)account completeHandler:(GetMemberBlock)handler;



/**
 * 申请关注
 *
 * @param mid 申请人id
 * @param mid2 被申请人id
 * @param remark 申请信息
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)applyFriendTaskWith:(NSString *)mid mid2:(NSString *)mid2 remark:(NSString *)remark completeHandler:(SimpleBlock)handler;



/**
 * 	按状态查询我的亲友列表
 *
 * @param mid 会员id
 * @param status 
        0：别人申请mid，待确认；
       00：mid申请别人，待确认；
        1:申请通过；2：别人申请mid，申请不通过；
       22：mid申请别人，申请不通过；
        3：取消关注；
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)findFriendsTaskWith:(NSString *)mid status:(NSString *)status completeHandler:(FindFriendsBlock)handler;

/**
 * 	查询申请关注信息列表
 *
 * @param mid 会员id
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
//+ (DfthTask *)findApplyListTaskWith:(NSString *)mid completeHandler:(FindApplyListBlock)handler;


/**
 * 	同意、拒绝与取消关注
 *
 * @param mid 会员id
 * @param status 状态，0：待确认；1:申请通过；2：申请不通过；3：取消关注；
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)applyResultTaskWith:(NSString *)mid status:(NSString *)status completeHandler:(SimpleBlock)handler;

/**
 * 申请关注
 *
 * @param id 申请记录id
 * @param mid 亲友会员id
 * @param nickname 昵称
 * @param handler 操作完成后的回调
 *
 * @return DfthTask
 */
+ (DfthTask *)editFriendTaskWith:(NSString *)id mid:(NSString *)mid nickname:(NSString *)nickname completeHandler:(SimpleBlock)handler;

@end
