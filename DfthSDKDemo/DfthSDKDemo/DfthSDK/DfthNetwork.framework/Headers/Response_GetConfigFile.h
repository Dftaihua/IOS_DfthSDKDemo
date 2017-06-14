//
//  Response_GetConfigFile.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response_GetConfigFile : NSObject
@property (nonatomic, copy) NSString *datasCode;
@property (nonatomic, copy) NSString *discribe;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, assign) int64_t saveTime;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientType;
@property (nonatomic, strong) NSDictionary *datas;
@end
