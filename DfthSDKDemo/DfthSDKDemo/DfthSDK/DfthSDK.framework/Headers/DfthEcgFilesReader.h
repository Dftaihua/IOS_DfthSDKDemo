//
//  DfthEcgFilesReader.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ECGStorageResult.h"
#import "Sport.h"

@interface DfthEcgFilesReader : NSObject

- (instancetype _Nonnull)initForRecord:(DfthEcgRecord * _Nonnull)record;

- (NSArray<NSNumber*> * _Nonnull)getEcgDataFrom:(unsigned long long)start ofLength:(unsigned long long)dataLen;
- (unsigned long long)getEcgDataLength;
- (NSArray<ECGStorageResult*> * _Nullable)getDatDataFrom:(unsigned long long)start ofLength:(unsigned long long)dataLen;
- (NSArray<Sport *> * _Nonnull)getAllSportState;
@end
