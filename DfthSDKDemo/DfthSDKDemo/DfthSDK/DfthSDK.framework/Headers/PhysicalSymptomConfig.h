//
//  PhysicalSymptomConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface PhysicalSymptomConfig : BaseArchiveObject
@property(nonatomic, assign) BOOL upload;//是否上传身体症状
@property(nonatomic, assign) int64_t intervalTime;//上传数据长度
@end
