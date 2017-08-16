//
//  Disease.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/4.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Disease : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) short hType;

- (instancetype)initWithName:(NSString *)name code:(NSString *)code type:(short)hType;

@end
