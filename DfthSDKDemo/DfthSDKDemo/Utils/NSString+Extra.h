//
//  NSString+Extra.h
//  ThreeInOne
//
//  Created by admin on 2017/2/21.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

- (CGFloat)widthOfFont:(UIFont *)font;

- (CGFloat)heightOfFont:(UIFont *)font;

- (CGFloat)heightOfFont:(UIFont *)font width:(CGFloat)width;

- (CGFloat)widthOfFont:(UIFont *)font height:(CGFloat)height;

- (NSInteger)linesOfFont:(UIFont *)font width:(CGFloat)width;

//+ (NSString *)getStringUseEcgRecordStartTime:(int64_t)startTime andEndTime:(int64_t)endTime;

//+ (NSString *)getStringUseEcgRecordStartTime:(int64_t)startTime andMeasureTimes:(int64_t)measureTimes;
//+ (NSString *)getStringUseEcgRecordStartTime:(int64_t)startTime andMeasureTimes:(int64_t)measureTimes endTime:(int64_t)endTime;

+ (NSMutableAttributedString *)getNSMutableAttStrWithAllStr:(NSString *)allStr someStr:(NSString *)someStr addAttributes:(NSDictionary<NSString *, id> *)attrs;

@end
