//
//  DfthPersonInfo.h
//  DfthSDK
//
//  Created by yue gao on 2017/3/22.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member: NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *nation;
@property(nonatomic, copy) NSString *blood;
@property(nonatomic, copy) NSString *telNumber;
@property(nonatomic, copy) NSString *kindredNumber;
@property(nonatomic, copy) NSString *kindredName;
@property(nonatomic, assign) int gender;
@property(nonatomic, assign) int birthday;
@property(nonatomic, assign) int height;
@property(nonatomic, assign) int weight;
@end

@interface Habit : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *code;
@end

@interface History : NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *code;
@end

@interface DfthPersonInfo : NSObject
@property(nonatomic, strong) Member *member;
@property(nonatomic, strong) NSArray<Habit*> *habits;
@property(nonatomic, strong) NSArray<History*> *historys;
@end
