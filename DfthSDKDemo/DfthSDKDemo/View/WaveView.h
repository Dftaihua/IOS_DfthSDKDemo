//
//  WaveView.h
//  BlueToothDemo
//
//  Created by admin on 2017/1/4.
//  Copyright © 2017年 com.dfth.BlueToothDemo. All rights reserved.
//

#import <UIKit/UIKit.h>






@interface WaveView : UIView



@property (nonatomic, assign) UIInterfaceOrientation orientation; // 屏幕状态

@property (nonatomic, strong) void((^updateWaveBlock)(int StartDataIndex));

@property (nonatomic, assign) int isSingle; // 是单道还是12导，默认YES，单道
@property (nonatomic , assign) int showLeadCount;  // 显示导联数,默认一个导，单道效果

@property (nonatomic, assign) int  ShowSecond;

// 默认显示实时心电图，touch事件不触发
// 实时心电图
- (void)drawWave:(NSArray *)data dataLen:(NSInteger)dataLen adunit:(float)adunit;
// 历史心电图
//- (void)drawWaveWithDataRecord:(DfthEcgRecord *)record adunit:(float)adunit;

- (void)drawWaveWithfileReader:(DfthEcgFilesReader *)filereader adunit:(float)adunit;

- (void)StartUpdateWaveStartDataNum:(int)StartDataIndex;

- (void)removeAllHeartWave;

- (void)setShowLeadNum:(NSInteger)leadNum;


- (void)initLeadCountConfig:(int)showLeadCount;

- (void)addAbserver;

- (void)removeAbserver;

@end
