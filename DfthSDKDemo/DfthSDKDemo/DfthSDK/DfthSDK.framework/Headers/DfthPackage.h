//
//  DfthPackage.h
//  DfthSDK
//
//  Created by yue gao on 2017/5/9.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DfthPackage : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, assign) int64_t invalidDate;
@property (nonatomic, copy) NSString *isExists; //是否已经领取, 0为未领取, 1为已领取
@end
