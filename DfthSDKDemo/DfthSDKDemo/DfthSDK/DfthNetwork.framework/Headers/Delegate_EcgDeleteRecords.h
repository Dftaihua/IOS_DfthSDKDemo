//
//  Delegate_EcgDeleteRecords.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/6/29.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Delegate_EcgDeleteRecords <NSObject>
- (void)ecgDeleteRecordsResult:(DfthNetResult *)result state:(NSDictionary *)state;
@end
