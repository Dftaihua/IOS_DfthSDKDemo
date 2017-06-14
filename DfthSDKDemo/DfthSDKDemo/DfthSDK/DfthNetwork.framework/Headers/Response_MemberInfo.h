//
//  Response_MemberInfo.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Habit.h"
#import "Disease.h"


@interface Member: NSObject
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *nation;
@property(nonatomic, copy) NSString *blood;
@property(nonatomic, copy) NSString *telNumber;
@property(nonatomic, copy) NSString *kindredNumber;
@property(nonatomic, copy) NSString *kindredName;
@property(nonatomic, assign) int gender;
@property(nonatomic, assign) int64_t birthday;
@property(nonatomic, assign) int height;
@property(nonatomic, assign) int weight;
@end

@interface Response_MemberInfo : NSObject
@property(nonatomic, strong) Member *member;
@property(nonatomic, strong) NSArray<Habit*> *habits;
@property(nonatomic, strong) NSArray<Disease*> *historys;
@property(nonatomic, copy) NSString *consRecord;
@property(nonatomic, copy) NSString *serviceInfo;
@end
