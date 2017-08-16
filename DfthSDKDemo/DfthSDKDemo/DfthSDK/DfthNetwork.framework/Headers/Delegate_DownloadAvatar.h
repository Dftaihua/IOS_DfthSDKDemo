//
//  Delegate_DownloadAvatar.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/20.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_DownloadAvatar.h"

@protocol Delegate_DownloadAvatar <NSObject>

- (void)downloadAvatarResult:(DfthNetResult *)result filePath:(NSString *)filePath;

@end

