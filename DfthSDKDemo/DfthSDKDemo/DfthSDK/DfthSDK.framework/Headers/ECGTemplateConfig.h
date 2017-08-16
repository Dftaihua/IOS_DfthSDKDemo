//
//  ECGTemplateConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface ECGTemplateConfig : BaseArchiveObject
@property(nonatomic, assign) BOOL upload;//是否上传模板
@property(nonatomic, assign) int64_t intervalTime;//上传数据长度
@property(nonatomic, assign) int64_t startUploadTime;//多长时间开始上传
@end
