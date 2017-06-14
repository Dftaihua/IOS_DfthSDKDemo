//
//  Delegate_GetHabitDictionary.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Habit.h"

@protocol Delegate_GetHabitDictionary <NSObject>

- (void)getHabitDictionaryResult:(DfthNetResult *)result response:(NSArray<Habit*> *)response;

@end
