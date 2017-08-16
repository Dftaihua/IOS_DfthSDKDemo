//
//  BpAnalysisConfig.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BaseArchiveObject.h"

@interface BpJudgeConfig : BaseArchiveObject
@property(nonatomic, assign) int maxHighPressure;//高压值上限
@property(nonatomic, assign) int minHighPressure;//高压值下限
@property(nonatomic, assign) int maxLowPressure;//低压值上限
@property(nonatomic, assign) int minLowPressure;//低压值下限
- (instancetype)initWithMaxHigh:(int)maxH minHigh:(int)minH maxLow:(int)maxL minLow:(int)minL;
@end


@interface BpAnalysisConfig : BaseArchiveObject
@property(nonatomic, strong) BpJudgeConfig *normalStandardJudgeConfig;//普通人血压达标线
@property(nonatomic, strong) BpJudgeConfig *kidneyStandardJudgeConfig;//肾病血压达标线
@property(nonatomic, strong) BpJudgeConfig *highestJudgeConfig;//普通人血压极高判断
@property(nonatomic, strong) BpJudgeConfig *higherJudgeConfig;//普通人血压偏高判断
@property(nonatomic, strong) BpJudgeConfig *highJudgeConfig;//普通人血压很高判断
@property(nonatomic, strong) BpJudgeConfig *lowJudgeConfig;//普通人血压偏低判断
@property(nonatomic, strong) BpJudgeConfig *lowerJudgeConfig;//普通人血压极低判断
@end
