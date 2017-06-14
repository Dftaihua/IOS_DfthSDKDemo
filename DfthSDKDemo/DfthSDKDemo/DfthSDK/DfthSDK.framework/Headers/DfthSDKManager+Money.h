//
//  DfthSDKManager+Money.h
//  DfthSDK
//
//  Created by gaoyue on 2017/6/13.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <DfthSDK/DfthSDK.h>

@interface DfthSDKManager (Money)
+ (DfthTask *)getFreePackagesForUser:(NSString *)userId complete:(PackagesBlock)handler;
+ (DfthTask *)orderPackages:(NSArray<DfthPackage *> *)packages forUser:(NSString *)userId complete:(SimpleBlock)handler;
@end
