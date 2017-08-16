//
//  DBModel.h
//  DfthDB
//
//  Created by gaoyue on 2017/6/21.
//  Copyright © 2017年 gaoyue. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMResultSet;

@protocol DBModel <NSObject>
+ (NSString *)getTableName;
+ (NSString *)getCreateTableString;
+ (NSString *)getPrimaryKeyName;
- (NSString *)getInsertKeysString;
- (NSString *)getInsertValuesString;
- (NSString *)getUpdateString;
- (void)getValueFrom:(FMResultSet *)set;
@end
