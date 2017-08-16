//
//  BpUploadConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface BpUploadConfig : BaseArchiveObject
@property(nonatomic, assign) BOOL uploadBP;//是否上传血压
@property(nonatomic, assign) BOOL bpTask;//是否创建血压任务
@end
