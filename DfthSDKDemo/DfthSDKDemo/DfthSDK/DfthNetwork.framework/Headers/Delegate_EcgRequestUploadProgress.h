//
//  Delegate_EcgRequestUploadProgress.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_EcgRequestUploadProgress.h"

@protocol Delegate_EcgRequestUploadProgress <NSObject>
- (void)ecgRequestUploadProgressResult:(DfthNetResult *)result response:(Response_EcgRequestUploadProgress *)response;
@end
