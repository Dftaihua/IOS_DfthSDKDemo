//
//  Delegate_EcgDownloadZipFile.h
//  DfthNetwork
//
//  Created by gaoyue on 2017/5/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Delegate_EcgDownloadZipFile <NSObject>
- (void)downloadZipFileResult:(DfthNetResult *)result filePath:(NSString *)filePath;
@end
