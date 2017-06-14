//
//  Habit.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/4.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Habit : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;

- (instancetype)initWithName:(NSString *)name code:(NSString *)code;

@end
