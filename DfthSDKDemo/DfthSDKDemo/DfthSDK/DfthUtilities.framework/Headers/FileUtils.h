//
//  FileUtils.h
//  MyBluetooth
//
//  Created by admin on 2016/12/13.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DFTH_ROOT_PATH      @"/Documents/DfthSDK" // 文件根目录
#define DFTH_ECG_PATH       @"/Documents/DfthSDK/store"
#define DFTH_CRASH_PATH     @"/Documents/DfthSDK/crash"
#define DFTH_SHARE_PATH     @"/Documents/DfthSDK/share"
#define DFTH_LOG_PATH       @"/Documents/DfthSDK/log"
#define DFTH_UPDATE_PATH    @"/Documents/DfthSDK/update"
#define DFTH_DB_PATH        @"/Documents/DfthSDK/DB"
#define DFTH_DOWNLOAD_PATH  @"/Documents/DfthSDK/download"

static int64_t const KB = 1024;
static int64_t const MB = 1024 * KB;

@interface FileUtils : NSObject

+(NSString *)getDfthRootPath;
+(NSString *)getDfthDBPath;
+(NSString *)getDfthLogPath;
+(NSString *)getDfthEcgStorePath;

+(NSString *)getDfthDownloadPath;

+(NSString *)makeEcgStoragePathWithUserId:(NSString*)userId measureTime:(int64_t)measureTime;
+(NSString *)makeBpStoragePathWithUserId:(NSString*)userId measureTime:(int64_t)measureTime;
+ (void)createPath:(NSString *)path;
+ (void)createFileAtPath:(NSString *)file;
+ (BOOL)deleteFileAtPath:(NSString *)file;
+ (void)deleteAllFilesAtPath:(NSString *)path;
+ (BOOL)isFileExistAtPath:(NSString *)file;

+(NSArray<NSString *> *)getFilesWithSuffix:(NSString *)suffix atPath:(NSString*)path;
+ (BOOL)moveFileFrom:(NSString*)from to:(NSString*)to;
@end
