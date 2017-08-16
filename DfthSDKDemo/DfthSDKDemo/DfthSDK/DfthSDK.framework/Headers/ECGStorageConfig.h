//
//  ECGStorageConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface ECGStorageConfig : BaseArchiveObject
@property(nonatomic, assign) int64_t ecgFileMaxSaveTime;//心电文件最长保存时间
@end
