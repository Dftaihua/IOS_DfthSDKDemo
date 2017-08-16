//
//  Request_EcgSlice.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

//#pragma pack(push,1)
//typedef struct{
//    u_int8_t type;
//    u_int32_t exceptionTime;
//    u_int32_t adunit;
//    u_int8_t leadCount;
//    u_int16_t len;
//} EcgSliceHeader;
//#pragma pack(pop)

@interface Request_EcgPiece : NSObject
@property (nonatomic, assign) int line;
@property (nonatomic, assign) int64_t measureBegin;
@property (nonatomic, assign) int64_t measureEnd;
@property (nonatomic, assign) int heartRateAvg;
@property (nonatomic, copy) NSString *diseases;
@property (nonatomic, assign) int64_t reportTime;
@property (nonatomic, copy) NSString *symptom;
@property (nonatomic, assign) int64_t symptomLast;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *appid;
@property (nonatomic, copy) NSString *mac;
#ifndef ZONE_DEV
@property (nonatomic, strong) NSString *isExperience;
@property (nonatomic, strong) NSString *timeZone;
#endif
@end

@interface Request_FileMeta : NSObject
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, assign) int64_t fileSize;
@property (nonatomic, copy) NSString *fileMd5Code;
@property (nonatomic, copy) NSString *fileType;
@end

@interface Request_EcgSlice : NSObject
@property(nonatomic, copy) NSString *userId;  //必填
@property(nonatomic, strong) NSData *data;
@property(nonatomic, strong) Request_EcgPiece *ecgPiece;
@property(nonatomic, strong) Request_FileMeta *fileMeta;
@end
