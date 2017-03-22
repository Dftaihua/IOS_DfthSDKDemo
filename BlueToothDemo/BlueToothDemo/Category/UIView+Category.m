//
//  UIView+Category.m
//  MyBluetooth
//
//  Created by admin on 2016/12/8.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
- (void)setX:(int)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}
- (void)setY:(int)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}
- (CGFloat)getWidth
{
   return self.frame.size.width;
}
- (CGFloat)getHeigth
{
    return self.frame.size.height;
}
- (void)setWidth:(int)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
}
- (void)setheight:(int)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end
