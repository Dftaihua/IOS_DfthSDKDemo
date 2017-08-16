//
//  ECGUploadConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"
#import "EmergencyECGConfig.h"
#import "PhysicalSymptomConfig.h"
#import "ECGTemplateConfig.h"

@interface ECGUploadConfig : BaseArchiveObject
@property(nonatomic, strong) NSArray<NSNumber *> *ecgSegmentTime;//心电大文件分段上传时间组
@property(nonatomic, strong) NSArray<NSNumber *> *ecgPieceReUploadTime;//心电片段重新传送时间组
@property(nonatomic, assign) BOOL allECGTask;//是否生成全数据任务
@property(nonatomic, assign) BOOL uploadAllECG;//是否上传全数据
@property(nonatomic, assign) BOOL pieceECGTask;//是否生成片段任务
@property(nonatomic, assign) BOOL uploadPieceECG;//是否上传片段数据
@property(nonatomic, assign) int64_t startUploadEmergencyECGTime;//开始上传紧急心电时间
@property(nonatomic, strong) EmergencyECGConfig *emergencyECGConfig;//紧急心电
@property(nonatomic, strong) PhysicalSymptomConfig *physicalSymptomConfig;//身体症状
@property(nonatomic, strong) ECGTemplateConfig *ecgTemplateConfig;//模板心电
@property(nonatomic, assign, getter=isTransportFilesOnlyWifi) BOOL transportFilesOnlyWifi;//是否仅在wifi下传输文件
@property(nonatomic, assign) int reUploadCount; //"reUploadCount":2,   //2是0,1,2，代表本次上传失败，会重传的次数
@property(nonatomic, assign) int reCheckTime; //"reCheckTime":120000,  //每2分钟，巡检一次未上传的数据
@end
