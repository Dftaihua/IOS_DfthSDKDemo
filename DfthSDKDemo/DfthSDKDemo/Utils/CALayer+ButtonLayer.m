//
//  CALayer+ButtonLayer.m
//  DfthSDKDemo
//
//  Created by liuyanmei on 17/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "CALayer+ButtonLayer.h"

@implementation CALayer (ButtonLayer)

- (void)setBorderUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

- (UIColor *)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
