//
//  StringUtils.h
//  DTthBlueTooth
//
//  Created by admin on 2016/11/4.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>
// 解析协议类
@interface StringUtils : NSObject

+(BOOL)isPhone:(NSString*)name;

+(BOOL)isPhoneAreaCode:(NSString *)areaCode phoneName:(NSString*)name;

+(BOOL)isName:(NSString*)name;

+(BOOL)isEmail:(NSString*)name;

+(BOOL)isNull:(NSString*)string;

+ (NSData *)convertHexStrToData:(NSString *)str;
+ (NSString *)convertDataToHexStr:(NSData *)data from:(int)start to:(NSUInteger)end;
@end
