//
//  NSString+Extra.m
//  ThreeInOne
//
//  Created by admin on 2017/2/21.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)

- (CGFloat)widthOfFont:(UIFont *)font
{
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.width;
}

- (CGFloat)heightOfFont:(UIFont *)font
{
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.height;
}

- (CGFloat)heightOfFont:(UIFont *)font width:(CGFloat)width
{
   CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    return ceil(rect.size.height);
}

- (CGFloat)widthOfFont:(UIFont *)font height:(CGFloat)height
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return ceil(rect.size.width);
}

- (NSInteger)linesOfFont:(UIFont *)font width:(CGFloat)width{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName : font}
                                     context:nil];
    
    return ceil(rect.size.height / font.lineHeight);
}
//+ (NSString *)getStringUseEcgRecordStartTime:(int64_t)startTime andMeasureTimes:(int64_t)measureTimes endTime:(int64_t)endTime
//{
//    NSString *startTimeStr = [DFTHTool stringFromDate:[NSDate dateWithTimeIntervalSince1970:startTime] format:@"yyyy.MM.dd HH:mm:ss"];
//    
//    
//    NSInteger hour = 0;
//    NSInteger min = 0;
//    NSInteger second = 0;
//    int64_t times;
//    if (measureTimes == 0) {
//    
//        times =  endTime - startTime;
//        
//    }else
//    {
//         times = measureTimes;
//        
//    }
//    
//    second = times % 60;
//    
//    min = times / 60 ;
//    hour =  min / 60;
//    min %= 60;
//    
//    
//    
//    
//    if (hour > 0) {
//        return [NSString stringWithFormat:@"%@( %ldh %ldm %lds )",startTimeStr,hour,min,second];
////        self.timeLabl.text = [NSString stringWithFormat:@"%@( %ldh %ldm %lds )",startTime,hour,min,second];
//        
//    }else if (min > 0)
//    {
//        return [NSString stringWithFormat:@"%@( %ldm %lds )",startTimeStr,min,second];
////        self.timeLabl.text = [NSString stringWithFormat:@"%@( %ldm %lds )",startTime,min,second];
//        
//    }else if (second > 0)
//    {
//        return [NSString stringWithFormat:@"%@( %lds )",startTimeStr,second];
////        self.timeLabl.text = [NSString stringWithFormat:@"%@( %lds )",startTime,second];
//    }else
//    {
//        return [NSString stringWithFormat:@"%@(0 s)",startTimeStr];
////        self.timeLabl.text = [NSString stringWithFormat:@"%@( )",startTime];
//    }
//
//}

+ (NSMutableAttributedString *)getNSMutableAttStrWithAllStr:(NSString *)allStr someStr:(NSString *)someStr addAttributes:(NSDictionary<NSString *, id> *)attrs
{
    
    NSRange cur_range1 = [allStr rangeOfString:someStr];
    NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc]initWithString:allStr];
    [mutableString addAttributes:attrs range:cur_range1];
   
    return mutableString;
}


@end
