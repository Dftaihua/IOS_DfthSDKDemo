//
//  UIButton+Category.h
//  DfthDemo
//
//  Created by admin on 2016/11/18.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)



+ (UIButton *)createBtnWithName:(NSString *)name hightLight:(BOOL)isHiLight supView:(UIView *)view frame:(CGRect)size;

- (void)canClick:(BOOL)can;

@end
