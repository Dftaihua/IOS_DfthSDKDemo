//
//  Request_EcgUploadComplete.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Real_EcgUploadComplete : NSObject
@property(nonatomic, assign) NSInteger fileSize;
@property(nonatomic, copy) NSString *fileMd5Code;

- (instancetype)initWithFilePath:(NSString *)path;
@end

@interface Request_EcgUploadComplete : NSObject
@property(nonatomic, copy) NSString *recordId;  //必填
@property(nonatomic, copy) NSString *fileFullPath;  //必填，文件全路径，包含文件后缀
@property(nonatomic, strong) Real_EcgUploadComplete *request;   //如果调用初始化函数，则外部不需要填写，会根据文件路径自动计算文件大小和MD5

- (instancetype)initWithRecordId:(NSString *)recordId filePath:(NSString *)path;
@end
