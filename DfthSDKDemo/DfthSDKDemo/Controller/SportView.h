//
//  SportView.h
//  ThreeInOne
//
//  Created by admin on 2017/3/21.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SportCountPerSecond 10  // 心仪设备每秒传过来的Sport数据个数


@interface SportView : UIView

@property (nonatomic, copy) void (^updateHear)(NSString *heartStr);

@property (nonatomic, copy) void (^updateState)(NSString *stateStr);

//@property (nonatomic, strong) DfthEcgRecord *ecgRecord;

- (int)setPathDatValue:(CGFloat)value;
- (void)setEcgFilesReader:(DfthEcgFilesReader *)fileRead;

@end
