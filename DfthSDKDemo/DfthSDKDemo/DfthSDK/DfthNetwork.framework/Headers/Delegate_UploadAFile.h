//
//  Delegate_UploadAFile.h
//  DfthNetwork
//
//  Created by liuyanmei on 2017/6/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response_UploadAFile.h"

@protocol Delegate_UploadAFile <NSObject>

- (void)uploadResult:(DfthNetResult *)result response:(Response_UploadAFile *)response;

@end
