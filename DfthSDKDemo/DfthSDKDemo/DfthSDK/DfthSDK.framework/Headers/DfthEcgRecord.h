//
//  DfthEcgRecord.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/11.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EcgAnalyseResult.h"
@class DfthSingleEcgDevice;
@class EcgRecord;

#define SUFFIX_ZIP @".zip"
#define SUFFIX_ECG @".ecg"
#define SUFFIX_DAT @".dat"
#define SUFFIX_SPORT @".sport"
#define SUFFIX_CONFIG @".ini"

typedef NS_ENUM(NSInteger, RecordState){
    MeasureStarted = 0,
    MeasureStopped,
    AnalyseComplete,
    UploadCompleted,
    AnalyseSended,
    TaskCreated,
    GotService,
    ReadService,
};

@interface DfthEcgRecord : NSObject
@property (nonatomic, copy) NSString *recordId;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *appId;

@property (nonatomic, copy) NSString *deviceMac;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, assign) int deviceLeadCount;
@property (nonatomic, assign) float sampling;
@property (nonatomic, assign) float ADUnit;
@property (nonatomic, assign) int blockSize;


@property (nonatomic, assign) int64_t measureStartTime;    //单位秒
@property (nonatomic, assign) int64_t measureEndTime;  //单位秒
@property (nonatomic, copy) NSString *storagePath;
@property (nonatomic, assign) int state;

@property (nonatomic, strong) EcgAnalyseResult *analyseResult;
@property (nonatomic, copy) NSString *symptom;
@property (nonatomic, assign) int symptomLast;

@property (nonatomic, copy) NSString *doctorName;
@property (nonatomic, copy) NSString *doctorResult;
@property (nonatomic, copy) NSString *doctorStatus;
@property (nonatomic, assign) int64_t serviceTime;     //单位秒
@property (nonatomic, assign) int serviceType;

@property (nonatomic, strong) NSMutableArray *exceptionInfo;

@property (nonatomic, assign) BOOL ecgFileUploaded;
@property (nonatomic, assign) BOOL datFileUploaded;
@property (nonatomic, assign) BOOL sportFileUploaded;
@property (nonatomic, assign) BOOL iniFileUploaded;
@property (nonatomic, assign) BOOL hasException;

@property (nonatomic, copy) NSString *doctorId;
@property (nonatomic, copy) NSString *doctorNo;
@property (nonatomic, assign) int score;
@property (nonatomic, assign) int64_t saveTime;
@property (nonatomic, assign) int64_t lastModifyTime;     //标识ini和dat的最后修改时间, 单位秒
@property (nonatomic, assign) BOOL datFileChanged;     //标识ini和dat文件是否被修改过
@property (nonatomic, assign) int64_t ecgDataLength;     //标识ini和dat文件是否被修改过

- (instancetype) initWith:(EcgRecord *)ecgRecord;
- (instancetype)initWithDevice:(DfthSingleEcgDevice *)device appId:(NSString *)appId;
@end
