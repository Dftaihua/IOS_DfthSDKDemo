//
//  FileMD5Utils.h
//  DfthSDK
//
//  Created by yue gao on 2017/1/23.
//  Copyright © 2017年 com.dfth.BlueToothLib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileMD5Utils : NSObject

+(NSString*)getFileMD5WithPath:(NSString*)path;
+ (NSString*)getMD5WithData:(NSData *)data;
@end
