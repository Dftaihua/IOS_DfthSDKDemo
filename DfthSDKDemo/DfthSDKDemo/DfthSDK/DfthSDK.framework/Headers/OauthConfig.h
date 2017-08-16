//
//  OauthConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface OauthConfig : BaseArchiveObject
@property(nonatomic, assign) BOOL oauth;//是否认证应用检查
@property(nonatomic, assign) BOOL expire;//是否应用过期检查
@end
