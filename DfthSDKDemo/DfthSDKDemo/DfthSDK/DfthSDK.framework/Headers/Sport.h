//
//  Sport.h
//  DfthSDK
//
//  Created by gaoyue on 2017/5/26.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sport : NSObject
@property (nonatomic, assign) int state;
@property (nonatomic, assign) int index;
- (instancetype)initWithState:(short)state index:(int)index;
@end
