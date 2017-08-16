//
//  MathUtils.h
//  MyBluetooth
//
//  Created by admin on 2016/11/29.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtils : NSObject
+ (short)getShortValueFromBuffer:(Byte [])buffer orderByLittleEndian:(BOOL)le;
+ (int)getIntValueFromBuffer:(Byte [])buffer orderByLittleEndian:(BOOL)le;
+ (float)getFloatValueFromBuffer:(Byte [])b orderByLittleEndian:(BOOL)le;
+ (long)getLongValueFromBuffer:(Byte *)buffer orderByLittleEndian:(BOOL)le;

+ (void)writeShortValue:(short)value toBuffer:(Byte *)buffer withLittleEndian:(BOOL)le;
+ (void)writeIntValue:(int)value toBuffer:(Byte *)buffer withLittleEndian:(BOOL)le;
+ (void)writeFloatValue:(float)value toBuffer:(Byte *)buffer withLittleEndian:(BOOL)le;
+ (void)writeLongValue:(long)value toBuffer:(Byte *)buffer withLittleEndian:(BOOL)le;
@end
