//
//  DfthEcgRecord.h
//  DfthDB
//
//  Created by gaoyue on 2017/6/21.
//  Copyright © 2017年 gaoyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBBaseObject.h"

typedef NS_ENUM(NSInteger, EcgRecordState){
    MeasureStarted = 0,
    MeasureStopped,
    AnalyseComplete,
    UploadCompleted,
    AnalyseSended,
    TaskCreated,
    GotService,
    ReadService,
};


@interface DfthEcgRecord : DBBaseObject
@property (nonatomic, copy) NSString *recordId;     //心电记录的ID
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *appId;

@property (nonatomic, copy) NSString *deviceMac;    //设备的mac地址
@property (nonatomic, copy) NSString *deviceName;   //设备的名称地址
@property (nonatomic, assign) int deviceLeadCount;  //设备的导联数,单道（心仪）为1，12导设备为12
@property (nonatomic, assign) double sampling;  //设备的采样率(250每秒)
@property (nonatomic, assign) double ADUnit;    //设备AD量化电平
@property (nonatomic, assign) int blockSize;
@property (nonatomic, copy) NSString *timeZone;     //该次测量发生时的时区

@property (nonatomic, assign) NSTimeInterval measureStartTime;    //测量开始时间,单位秒
@property (nonatomic, assign) NSTimeInterval measureEndTime;  //测量结束时间,单位秒
@property (nonatomic, assign) unsigned long long ecgDataLength;     //ecg数据的总个数
@property (nonatomic, copy) NSString *storagePath;      //该测量相关文件的存储路径，不包含文件后缀(.ecg .dat .ini .sport)
@property (nonatomic, assign) EcgRecordState state;     //该心电记录的状态
@property (nonatomic, assign) BOOL ecgFileUploaded;     //ecg文件是否已上传
@property (nonatomic, assign) BOOL otherFilesUploaded;  //其他文件是否已上传
@property (nonatomic, assign) int measureMode;  //测量模式，包括长程测量，手动测量，体验测量等

@property (nonatomic, copy) NSString *doctorId;     //为本记录服务的医师的id
@property (nonatomic, copy) NSString *doctorNo;     //医师编号
@property (nonatomic, copy) NSString *doctorName;   //医师姓名
@property (nonatomic, copy) NSString *doctorResult;     //医师分析结果
@property (nonatomic, copy) NSString *doctorStatus;     //医师分析状态
@property (nonatomic, assign) int serviceType;      //医师服务的类型
@property (nonatomic, assign) NSTimeInterval serviceTime;     //医师服务的时间，单位秒
@property (nonatomic, assign) NSTimeInterval saveTime;      //记录保存时间
@property (nonatomic, assign) NSTimeInterval lastModifyTime;     //标识ini和dat的最后修改时间, 单位秒
@property (nonatomic, assign) BOOL datFileChanged;     //标识ini和dat文件是否被修改过

@property (nonatomic, assign) int heartBeatCount;   //心搏总数
@property (nonatomic, assign) int heartRateAvg;     //平均心率
@property (nonatomic, assign) int heartRateMax;     //最大心率
@property (nonatomic, assign) int heartRateMin;     //最小心率
@property (nonatomic, assign) int heartRateMaxRPeak;        //最大心率对应的RPeak
@property (nonatomic, assign) int heartRateMinRPeak;        //最小心率对应的RPeak
@property (nonatomic, assign) int pvcCount;          //室性早搏的个数
@property (nonatomic, assign) int spCount;          //室上性早搏的个数
@property (nonatomic, strong) NSString *pvcRPeakArray;      //室性早搏对应的RPeak
@property (nonatomic, strong) NSString *spRPeakArray;       //室上性早搏对应的RPeak
@property (nonatomic, copy) NSString *diseases;     //本次测量中发生的疾病
@property (nonatomic, copy) NSString *symptom;      //本次测量中用户选择的身体症状
@property (nonatomic, assign) int symptomLast;      //本次测量中身体症状的持续时间
@property (nonatomic, assign) int score;        //心电评分

//@property (nonatomic, assign) BOOL hasException;
//@property (nonatomic, strong) NSString *exceptionInfo;

@end
