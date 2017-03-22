//
//  DfthEcgFilesReader.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DfthEcgRecord.h"
#import "ECGStorageResult.h"

@interface DfthEcgFilesReader : NSObject

- (instancetype)initForRecord:(DfthEcgRecord *)record;

- (NSArray<NSNumber*> *)getEcgDataFrom:(int)start ofLength:(int)dataLen;
- (NSUInteger)getEcgDataLength;
- (NSArray<ECGStorageResult*> * _Nullable)getDatDataFrom:(int)start ofLength:(int)dataLen;
- (NSArray<NSNumber *> *)getAllSportState;
@end
