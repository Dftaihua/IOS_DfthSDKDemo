//
//  Request_EcgDownloadFile.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/29.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_EcgDownloadFile : NSObject
@property (nonatomic, copy) NSString *recordId;
@property (nonatomic, copy) NSString *fileType;
@property (nonatomic, copy) NSString *filePath;

- (instancetype)initWithRecordId:(NSString *)recordId filePath:(NSString *)filePath;
@end
