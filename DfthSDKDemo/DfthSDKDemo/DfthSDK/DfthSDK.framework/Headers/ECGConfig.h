//
//  ECGConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"
#import "ECGUploadConfig.h"
#import "ECGAnalysisConfig.h"
#import "ECGStorageConfig.h"
#import "ECGDownloadConfig.h"
#import "ECGMeasureConfig.h"

@interface ECGConfig : BaseArchiveObject
@property(nonatomic, strong) ECGUploadConfig *ecgUploadConfig;
@property(nonatomic, strong) ECGAnalysisConfig *ecgAnalysisConfig;
@property(nonatomic, strong) ECGStorageConfig *ecgStorageConfig;
@property(nonatomic, strong) ECGDownloadConfig *ecgDownloadConfig;
@property(nonatomic, strong) ECGMeasureConfig *ecgMeasureConfig;
@end
