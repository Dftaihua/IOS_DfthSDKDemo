//
//  UIButton+Category.m
//  DfthDemo
//
//  Created by admin on 2016/11/18.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import "UIButton+Category.h"
//#import <Masonry.h>

@implementation UIButton (Category)


+ (UIButton *)createBtnWithName:(NSString *)name hightLight:(BOOL)isHiLight supView:(UIView *)view frame:(CGRect)size
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:name forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = size;
    [btn setTitleColor:[UIColor whiteColor ]forState:UIControlStateNormal];
    
    [view addSubview:btn];
    
    return btn;
}

- (void)canClick:(BOOL)can
{
    if (can) {
        self.backgroundColor = [UIColor blueColor];
        self.enabled = YES;
    }else
    {
        self.backgroundColor = [UIColor lightGrayColor];
        self.enabled = NO;
    }
}

@end
