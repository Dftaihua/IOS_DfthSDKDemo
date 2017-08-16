//
//  Request_DownloadAvatar.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/20.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_DownloadAvatar : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *fileType;
@property (nonatomic, copy) NSString *filePath;

- (instancetype)initWithUserId:(NSString *)userId filePath:(NSString *)filePath;

@end
