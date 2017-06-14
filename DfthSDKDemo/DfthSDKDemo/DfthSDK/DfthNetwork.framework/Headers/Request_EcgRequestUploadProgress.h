//
//  Request_EcgRequestUploadProgress.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Real_EcgRequestUploadProgress : NSObject
@property(nonatomic, copy) NSString *businessType;  //@"101"
@property(nonatomic, copy) NSString *fileName;
- (instancetype)initWithFilePath:(NSString *)path;
@end


@interface Request_EcgRequestUploadProgress : NSObject
@property(nonatomic, copy) NSString *recordId;  //必填
@property(nonatomic, copy) NSString *fileFullPath;  //必填，文件全路径，包含文件后缀
@property(nonatomic, strong) Real_EcgRequestUploadProgress *request;

- (instancetype)initWithRecordId:(NSString *)recordId filePath:(NSString *)path;
@end
