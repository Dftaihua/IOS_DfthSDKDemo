//
//  UILabel+Category.m
//  DfthDemo
//
//  Created by admin on 2016/11/18.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import "UILabel+Category.h"
//#import <Masonry.h>

@implementation UILabel (Category)

+ (UILabel *)createLblWithtopView:(UIView *)view supView:(UIView *)father num:(int)i
{
    UILabel *Lbl = [[UILabel alloc] init];
    [father addSubview:Lbl];
    
    if ([father isEqual:view]) {
        CGRect rect =  CGRectMake(father.frame.origin.x+10, father.frame.origin.y, father.frame.size.width - 20, 25);
        
        [Lbl setFrame:rect];
    }else{
        CGRect rect =  CGRectMake(father.frame.origin.x+10, view.frame.origin.y+view.frame.size.height, father.frame.size.width - 20, 25);
        
        [Lbl setFrame:rect];
         
    }
    Lbl.textColor = [UIColor lightGrayColor];
    
    
    return Lbl;
}

@end
