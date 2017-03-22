//
//  DfthSDKConfig.h
//  DfthSDK
//
//  Created by admin on 2017/1/21.
//  Copyright © 2017年 com.dfth.BlueToothLib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DfthSDKConfig : NSObject
@property(nonatomic, copy) NSString *version;
@property(nonatomic, assign) BOOL isLog2File;
@property(nonatomic, assign) BOOL withNetwork;
@property(nonatomic, copy) NSString *baseUrl;
@property(nonatomic, assign) BOOL debugNet;

@end
