//
//  DfthEcgRecord.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/11.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EcgRecord;

@interface DfthEcgRecord : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *recordId;
@property (nonatomic, copy) NSString *deviceMac;
@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *diseases;
@property (nonatomic, copy) NSString *doctorName;
@property (nonatomic, copy) NSString *doctorResult;
@property (nonatomic, copy) NSString *storagePath;
@property (nonatomic, copy) NSString *symptom;
@property (nonatomic, assign) long measureStartTime;
@property (nonatomic, assign) long measureEndTime;
@property (nonatomic, assign) long serviceTime;
@property (nonatomic, assign) int heartBeatCount;
@property (nonatomic, assign) int heartRateAvg;
@property (nonatomic, assign) int heartRateMax;
@property (nonatomic, assign) int heartRateMin;
@property (nonatomic, assign) int heartRateMaxRPeak;
@property (nonatomic, assign) int heartRateMinRPeak;
@property (nonatomic, assign) int pvcCount;
@property (nonatomic, assign) int score;
@property (nonatomic, assign) int serviceType;
@property (nonatomic, assign) int spCount;
@property (nonatomic, assign) int state;
@property (nonatomic, assign) int uploadProgress;
@property (nonatomic, assign) int deviceLeadCount;
@property (nonatomic, strong) NSArray<NSNumber*> *pvcRPeakArray;
@property (nonatomic, strong) NSArray<NSNumber*> *spRPeakArray;
@property (nonatomic, strong) NSArray<NSNumber*> *longRRRPeakArray;
@property (nonatomic, strong) NSArray<NSString*> *diseaseNameArray;

- (instancetype) initWith:(EcgRecord *)ecgRecord;
@end
