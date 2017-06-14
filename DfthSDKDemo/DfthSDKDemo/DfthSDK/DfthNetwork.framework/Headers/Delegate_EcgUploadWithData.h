//
//  Delegate_EcgUploadWithData.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/1.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_EcgUploadWithData.h"

@protocol Delegate_EcgUploadWithData <NSObject>
- (void)ecgUploadWithDataResult:(DfthNetResult *)result response:(Response_EcgUploadWithData *)response;
@end
