//
//  ECGStorageResult.h
//  DfthSDK
//
//  Created by bin on 07/02/2017.
//  Copyright © 2017 com.dfth.BlueToothLib. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma pack(push, 1)
typedef struct{
    short        _ST[12];    // ST段
    short        _Rhythm ;   // 单个心拍判别结果
    short        _Classify2;
    short        _Waveform;  // 形态诊断结果
    int          _R_peak;
    short        _HeartRate;
    short        _Classify;  // 分类结果
    short        _Rhythm2;
}DatOriginal;
#pragma pack(pop)

typedef struct{
    short        _ST[12];    // ST段
    short        _Rhythm ;   // 单个心拍判别结果
    short        _Axis;      // 心电轴诊断结果
    short        _Waveform;  // 形态诊断结果
    short        _Rhythm2;   // 心律诊断结果
    short        _Classify;  // 分类结果
    short        _Classify2;  // 20150610
    int          _R_peak;
    short        _HeartRate;
    short        _RR;
    short        _ST_Value[12]; //
    short        _QRS_width;
}DatHolter;


@interface ECGStorageResult : NSObject
{
    short _ST[12];
    char *_pCharacter;
}

@property (nonatomic, assign) short Axis;
@property (nonatomic, assign) short Classify;
@property (nonatomic, assign) short Classify2;
@property (nonatomic, assign) short Rhythm;
@property (nonatomic, assign) short Rhythm2;
@property (nonatomic, assign) short Waveform;
@property (nonatomic, assign) int   R_peak;
@property (nonatomic, assign) short RR;
@property (nonatomic, assign) short HeartRate;
@property (nonatomic, assign) short QRSWidth;

- (instancetype)init;
- (instancetype)initWith:(const u_char *)data dataSize:(int)dataSize;
- (void) set_ST:(short[]) st;

- (NSData *)getNSData;

- (short *)getST;
- (void)setPCharacter:(char *)pCharacter;
- (char *)getPCharacter;

@end
