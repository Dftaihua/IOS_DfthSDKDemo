//
//  Delegate_GetDiseaseDictionary.h
//  DfthNetwork
//
//  Created by liuyanmei on 17/5/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Disease.h"

@protocol Delegate_GetDiseaseDictionary <NSObject>

- (void)getDiseaseListResult:(DfthNetResult *)result response:(NSArray<Disease*> *)response;

@end

