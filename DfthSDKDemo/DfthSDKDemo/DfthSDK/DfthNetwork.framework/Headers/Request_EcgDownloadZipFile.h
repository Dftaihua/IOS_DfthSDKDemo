//
//  Request_EcgDownloadZipFile.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request_EcgDownloadZipFile : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *recordId;
@property (nonatomic, copy) NSString *fileName;

- (instancetype)initWithUserId:(NSString *)userId recordId:(NSString *)recordId fileName:(NSString *)fileName;
@end
