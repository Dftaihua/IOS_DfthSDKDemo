//
//  ECGUtils.h
//  DfthSDK
//
//  Created by admin on 2017/1/19.
//  Copyright © 2017年 com.dfth.BlueToothLib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECGUtils : NSObject
/**
 *      将数组清除为bool
 */
+ (void)clearBooleans:(BOOL [])bools lens:(NSInteger)len changeValue:(BOOL)changeBool;

+ (BOOL)judgeBooleans:(BOOL [])bools lens:(NSInteger)len isBool:(BOOL)changeBool;
@end
