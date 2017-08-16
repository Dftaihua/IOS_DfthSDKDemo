//
//  BPConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"
#import "BpAnalysisConfig.h"
#import "BpUploadConfig.h"

@interface BPConfig : BaseArchiveObject
@property(nonatomic, strong) BpAnalysisConfig *analysisConfig;//血压分析
@property(nonatomic, strong) BpUploadConfig *uploadConfig;//血压上传
@end
