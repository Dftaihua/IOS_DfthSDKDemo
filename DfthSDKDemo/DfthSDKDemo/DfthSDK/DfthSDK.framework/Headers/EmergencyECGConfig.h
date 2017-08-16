//
//  EmergencyECGConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface Rhythm : BaseArchiveObject
@property(nonatomic, assign) int rhythm;//心律疾病
@property(nonatomic, assign) int64_t continueTime;//持续时间
@property(nonatomic, assign) int64_t intervalTime;//上传数据长度
@end

@interface ST : BaseArchiveObject
@property(nonatomic, assign) int stHigh;//抬高
@property(nonatomic, assign) int stLow;//降低
@property(nonatomic, assign) int64_t continueTime;//持续时间
@property(nonatomic, assign) int64_t intervalTime;//上传数据长度
@end

@interface HR : BaseArchiveObject
@property(nonatomic, assign) int minHR;//心律阈值下限
@property(nonatomic, assign) int maxHR;//心律阈值上限
@property(nonatomic, assign) int64_t continueTime;//持续时间
@property(nonatomic, assign) int64_t intervalTime;//上传数据长度
@end

@interface Peak : BaseArchiveObject
@property(nonatomic, assign) int minPeak;//两个心拍之间的P波下限位置
@property(nonatomic, assign) int maxPeak;//两个心拍之间的P波上限位置
@property(nonatomic, assign) int64_t continueTime;//持续时间
@property(nonatomic, assign) int64_t intervalTime;//上传数据长度
@end

@interface EmergencyECGConfig : BaseArchiveObject
@property(nonatomic, strong) NSArray<Rhythm*> *rhythms;//心律疾病列表
@property(nonatomic, strong) ST *st;//ST
@property(nonatomic, strong) HR *hr;//hr
@property(nonatomic, strong) Peak *peak;//peak
@end
