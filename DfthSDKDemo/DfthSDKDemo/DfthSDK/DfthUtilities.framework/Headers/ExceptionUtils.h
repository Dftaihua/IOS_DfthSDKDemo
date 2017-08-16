//
//  ExceptionUtils.h
//  ThreeInOne
//
//  Created by gaoyue on 2017/6/8.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExceptionUtils : NSObject
+(void)installUncaughtExceptionHandler;
+(void)InstallSignalHandler;
@end
