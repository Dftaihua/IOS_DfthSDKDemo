//
//  NSString+FileSize.h
//  DfthSDK
//
//  Created by yue gao on 2017/1/23.
//  Copyright © 2017年 com.dfth.BlueToothLib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (File)
- (unsigned long long)fileSize;
- (NSString *)getDfthNetFileType;
- (NSString *)getBussinessType;
@end
