//
//  Request_HabitUpdate.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Habit.h"

@interface Request_HabitUpdate : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, strong) NSArray<Habit *> *request;
- (instancetype)initWithUserId:(NSString *)userId habit:(NSArray<Habit*> *)habits;

@end
