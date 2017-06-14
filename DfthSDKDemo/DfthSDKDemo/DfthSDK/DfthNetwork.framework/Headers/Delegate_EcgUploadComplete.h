//
//  Delegate_EcgUploadComplete.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_EcgUploadComplete.h"

@protocol Delegate_EcgUploadComplete <NSObject>
- (void)ecgUpdateCompleteResult:(DfthNetResult *)result response:(Response_EcgUploadComplete *)response;
@end
