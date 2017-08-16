//
//  Response_getMember.h
//  DfthNetwork
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_getMember : NSObject

@property(nonatomic, copy) NSString *mid;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger gender;
@property(nonatomic, assign) long birthday;
@property(nonatomic, copy) NSString *picture;
@property (nonatomic, strong) NSString* telNumber;

@end
