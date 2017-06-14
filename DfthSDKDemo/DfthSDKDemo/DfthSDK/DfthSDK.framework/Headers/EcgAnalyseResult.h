//
//  EcgAnalyseResult.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/15.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EcgRecord;

@interface EcgAnalyseResult : NSObject

@property (nonatomic, assign) int heartBeatCount;
@property (nonatomic, assign) int heartRateAvg;
@property (nonatomic, assign) int heartRateMax;
@property (nonatomic, assign) int heartRateMin;
@property (nonatomic, assign) int heartRateMaxRPeak;
@property (nonatomic, assign) int heartRateMinRPeak;
@property (nonatomic, assign) int pvcCount;
@property (nonatomic, assign) int spCount;

@property (nonatomic, copy) NSString *diseases;

@property (nonatomic, strong) NSMutableArray<NSNumber*> *pvcRPeakArray;
@property (nonatomic, strong) NSMutableArray<NSNumber*> *spRPeakArray;
@property (nonatomic, strong) NSMutableArray<NSNumber*> *longRRRPeakArray;
@property (nonatomic, strong) NSMutableArray<NSNumber*> *diseaseTypeArray;
@property (nonatomic, strong) NSMutableArray<NSString*> *diseaseNameArray;

- (instancetype)initWith:(EcgRecord *)record;
@end
