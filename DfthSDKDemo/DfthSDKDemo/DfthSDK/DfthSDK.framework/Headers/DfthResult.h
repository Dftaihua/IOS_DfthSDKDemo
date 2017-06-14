//
//  DfthResult.h
//  DfthSDK
//
//  Created by yue gao on 2017/2/24.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, DfthReturnCode)
{
    DfthRC_Ok = 0,
    DfthRC_Error,
    DfthRC_DoNothing,
};

@interface DfthResult : NSObject
@property(nonatomic, assign)int code;
@property(nonatomic, copy)NSString *message;

- (instancetype)initWithCode:(int)code message:(NSString *)message;

+(DfthResult *)getDefaultErrorResult;
+(DfthResult *)getDefaultOkResult;
+(DfthResult *)getDefaultDoNothing;

@end
