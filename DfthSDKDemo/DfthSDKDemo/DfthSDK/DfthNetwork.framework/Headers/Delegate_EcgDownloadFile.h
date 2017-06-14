//
//  Delegate_EcgDownloadFile.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/29.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Delegate_EcgDownloadFile <NSObject>
- (void)ecgDownloadFileResult:(DfthNetResult *)result filePath:(NSString *)filePath;
@end
