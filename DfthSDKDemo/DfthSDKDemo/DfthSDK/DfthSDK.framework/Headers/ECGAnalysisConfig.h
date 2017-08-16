//
//  ECGAnalysisConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface ECGAnalysisConfig : BaseArchiveObject
@property(nonatomic, assign) BOOL twiceAnalysis;//是否二次分析
@property(nonatomic, assign) int64_t doctorMinAnalysisTime;//医生分析需要最小的心电长度
@property(nonatomic, assign) BOOL filter;//是否滤波
@end
