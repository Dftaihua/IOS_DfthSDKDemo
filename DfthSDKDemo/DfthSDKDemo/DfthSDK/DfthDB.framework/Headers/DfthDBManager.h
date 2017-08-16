//
//  DfthDBManager.h
//  DfthDB
//
//  Created by gaoyue on 2017/6/21.
//  Copyright © 2017年 gaoyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBModel.h"
@class FMDatabaseQueue;

const static NSString *tableCooperator = @"DfthCooperator";
const static NSString *tableUser = @"DfthUser";
const static NSString *tableEcgRecord = @"DfthEcgRecord";
const static NSString *tableBpData = @"DfthBpData";
const static NSString *tableBpPlan = @"DfthBpPlan";

@interface DfthDBManager : NSObject
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) FMDatabaseQueue *queue;


+ (DfthDBManager *)sharedInstance;
- (void)initWithPath:(NSString *)path name:(NSString *)name;

+ (void)setupDB2Path:(NSString *)path withName:(NSString *)name;

//+ (NSString *)getSqlKeyString:(NSObject *)obj;
//+ (NSString *)getSqlValueString:(NSObject *)obj;
//+ (NSString *)getSqlUpdateString:(NSObject *)obj;


+ (void)insertRecord:(NSObject<DBModel> *)record;
+ (void)updateRecord:(NSObject<DBModel> *)record withKeyName:(NSString*)keyName;
+ (void)deleteRecord:(NSObject<DBModel> *)record withKeyName:(NSString*)keyName;
+ (BOOL)isExistRecord:(NSObject<DBModel> *)record withKeyName:(NSString *)keyName;
+ (BOOL)isExistRecordOfClass:(Class)clazz where:(NSString *)where;
+ (NSMutableArray *)getRecordsOfClass:(Class)clazz withKey:(NSString *)key equalToValue:(NSString *)value;
+ (NSMutableArray *)getRecordsOfClass:(Class)clazz withKey:(NSString *)key lessThanValue:(NSString *)value;
+ (NSMutableArray *)getRecordsOfClass:(Class)clazz withKey:(NSString *)key greaterThanValue:(NSString *)value;

+ (NSMutableArray *)getRecordsofClass:(Class)clazz where:(NSString *)where orderBy:(NSString *)order limit:(NSString *)limit;
@end
