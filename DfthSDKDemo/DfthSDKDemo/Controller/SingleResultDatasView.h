//
//  SingleResultDatasView.h
//  ThreeInOne
//
//  Created by admin on 2017/3/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    ButtongPVC,
    ButtongSP,
    ButtongMaxHeart,
    ButtongMinHeart,
} ButtonTag;


@interface SingleResultDatasView : UIView

@property (nonatomic, copy) void (^btnClickBlock)(UIButton *,int); //

- (instancetype)initWithHeight:(CGFloat)Height  withType:(DfthEcgRecord *)type;

- (void)setLblValue:(NSArray *)title;

- (void)setButtonTimes:(NSArray *)times;

- (void)refreshArrwithType:(DfthEcgRecord *)type;

@end
