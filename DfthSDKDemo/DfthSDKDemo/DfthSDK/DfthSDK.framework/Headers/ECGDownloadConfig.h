//
//  ECGDownloadConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface ECGDownloadConfig : BaseArchiveObject
@property(nonatomic, assign) BOOL updateServerAnalysisData;//是否更新服务器分析过的数据
@end
