//
//  Request_UploadAFile.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_FileMetaData : NSObject
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, assign) int64_t fileSize;
@property (nonatomic, copy) NSString *fileMd5Code;
@property (nonatomic, copy) NSString *businessType;
- (instancetype)initWith:(NSString *)fileName data:(NSData *)data;
@end


@interface Request_UploadAFile : NSObject
@property(nonatomic, copy) NSString *userId;  //必填
@property (nonatomic, copy) NSString *fileType;
@property (nonatomic, copy) NSString *filePath;
@property(nonatomic, strong) NSData *data;
@property(nonatomic, strong) Request_FileMetaData *fileMeta;

- (instancetype) initWithUserId:(NSString *)userId filePath:(NSString *)filePath fileData:(NSData *)fileData;

@end
