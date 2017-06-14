//
//  Delegate_GetConfigFile.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/16.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_GetConfigFile.h"

@protocol Delegate_GetConfigFile <NSObject>
- (void)getConfigFileResult:(DfthNetResult *)result response:(Response_GetConfigFile *)response;

@end
