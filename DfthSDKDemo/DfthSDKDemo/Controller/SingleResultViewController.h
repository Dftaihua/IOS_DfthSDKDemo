//
//  SingleResultViewController.h
//  ThreeInOne
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleResultViewController : UIViewController

//@property (nonatomic, assign) DfthDeviceType type;

@property (nonatomic, strong) DfthEcgRecord *ecgRecord;

//@property (nonatomic,assign) MeasureType measureType;

//@property (nonatomic, assign) BOOL showDoctor; // 默认NO，

@property (nonatomic, assign) BOOL isMeasureResult; // 默认NO：(心电详情) yes:(心电结果)

- (void)refreshAllsubViews;

@end
