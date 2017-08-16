//
//  SingleResultDatasView.m
//  ThreeInOne
//
//  Created by admin on 2017/3/2.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "SingleResultDatasView.h"

#import <Masonry.h>
#import "NSString+Extra.h"

#define KSCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define KSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height


@interface SingleResultDatasView()
{
    UILabel *_startTimeLbl;
    UILabel *_durationLbl;
    UILabel *_avargeHeartLbl;
    UILabel *_heartNumsLbl;
    
    NSArray *_btnValuesArray;
    NSMutableArray *_btnArray; // 顺序从左到右
    int _pvcBtnNum; // 默认0，
    int _spBtnNum; // 默认0
    
    NSArray *_lblValuesArr;
    NSMutableArray *_lblArray; // 顺序从左到右，再到第二行再开始从左到右
    
    CGFloat _selfHeight;
    UIColor *_mainColor;
    
    
    NSArray<NSNumber*> *_pvcRPeakArray;
    NSArray<NSNumber*> *_spRPeakArray;
    int _heartRateMaxRPeak;
   int _heartRateMinRPeak;
    
//    int _type;
}

@end

@implementation SingleResultDatasView

- (instancetype)initWithHeight:(CGFloat)Height withType:(DfthEcgRecord *)type
{
    self = [super init];
    if (self) {
        if (type.deviceLeadCount == 1) {
            _mainColor = [UIColor blueColor];
        }else
        {
            _mainColor =[UIColor blueColor];
        }
        _pvcRPeakArray = [type.pvcRPeakArray jsonStringToNSArray];
        _spRPeakArray = [type.spRPeakArray jsonStringToNSArray];
        _heartRateMaxRPeak = type.heartRateMaxRPeak;
        _heartRateMinRPeak = type.heartRateMinRPeak;
//        _type = type;
        _btnArray = [[NSMutableArray alloc] init];
        _lblArray = [[NSMutableArray alloc] init];
        _lblValuesArr = @[@"测量时间",@"心搏总数",@"平均心率"];
         _btnValuesArray = [[NSArray alloc] initWithObjects:@"室性心搏",@"室上性心搏",@"最高心率",@"最低心率", nil];
        _selfHeight = Height;
        [self createUI];
    }
    return self;
}
- (void)createUI
{
   
    int lblHeight = 40 / 736.0 * KSCREEN_HEIGHT;
    
     CGFloat topBottomSpace = ((_selfHeight - lblHeight * 2 - 60 / 736.0 * KSCREEN_HEIGHT) / 6.0);

//    CGFloat lblSpace = 0;
    
    void (^makeLeftRightBlock)(int,MASConstraintMaker *) = ^(int x,MASConstraintMaker *make)
    {
        if (x == 0) {
            make.left.equalTo(self.mas_left).offset(5);
            make.right.equalTo(self.mas_right);
             make.top.equalTo(self.mas_top).offset(topBottomSpace);
//                make.top.equalTo(self.mas_top).offset(lblSpace);
        }else
        {
            make.top.equalTo(self.mas_top).offset((topBottomSpace + 26 + topBottomSpace));
//            make.top.equalTo(self.mas_top).offset((lblSpace + 26 + lblSpace));
        }
        if (x==1) {
            make.left.equalTo(self.mas_left).offset(5);
            make.width.equalTo(@(KSCREEN_WIDTH / 2 - 5));
        }else if(x == 2)
        {
            make.right.equalTo(self.mas_right).offset(-5);
            make.width.equalTo(@(KSCREEN_WIDTH / 2 - 5));
        }
    };
    
    
    int lblSize = 20 / 736.0 * KSCREEN_HEIGHT;
    
    for (int i = 0; i < 3; i++) {
        
        UILabel *lbl= [[UILabel alloc] init];
        [self addSubview:lbl];
        [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            makeLeftRightBlock(i,make);
            make.height.equalTo(@(lblHeight));
        }];
//        if (i == 0) {
//            lbl.backgroundColor = [UIColor redColor];
//        }else if (i == 1)
//        {
//            lbl.backgroundColor = [UIColor blueColor];
//        }else if (i == 2)
//        {
//            lbl.backgroundColor = [UIColor yellowColor];
//        }
//        lbl.backgroundColor = [UIColor redColor];
        lbl.text = _lblValuesArr[i];
        lbl.textColor = [UIColor blackColor];
        lbl.adjustsFontSizeToFitWidth = YES;
        lbl.font = [UIFont systemFontOfSize:lblSize];
//        lbl.backgroundColor = [UIColor redColor];
        [_lblArray addObject:lbl];
    }
   
   
    CGFloat btnWidth = (KSCREEN_WIDTH - 10*5) / 4.0;
    
    int btnSize = 14 / 736.0 * KSCREEN_HEIGHT;
    
    for (int i = 0; i < 4; i++) {
        
        UIButton *btn= [[UIButton alloc] init];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(btnWidth));
            UILabel *thirdLbl = _lblArray[2];
            make.top.equalTo(thirdLbl.mas_bottom).offset(topBottomSpace);
            make.bottom.equalTo(self.mas_bottom).offset(-(topBottomSpace * 2));
            make.left.equalTo(@(10*i + 10 + i * btnWidth));
        }];
        btn.layer.borderWidth = 1.5;
        btn.tag = i;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            
//                btn.layer.borderColor = _mainColor.CGColor;
        }
        
//        btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        NSString *timesStr = @"次";
        if (i >= 2) {
            timesStr = @"bpm";
        }
        NSString *str = [NSString stringWithFormat:@"%d%@\n%@",0,timesStr,_btnValuesArray[i]];
        [btn setTitle:str forState: UIControlStateNormal];
//        [btn.titleLabel adjustsFontSizeToFitWidth];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:btnSize];
        btn.titleLabel.numberOfLines = 2;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [_btnArray addObject:btn];
    }
    
}
- (void)setLblValue:(NSArray *)title
{
    for (int i = 0; i < title.count; i++) {
        
        UILabel *lbl = _lblArray[i];
        lbl.text = [NSString stringWithFormat:@"%@:%@",_lblValuesArr[i],title[i]];
        
    }
}
- (void)setButtonTimes:(NSArray *)times
{
     for (int i = 0; i < times.count; i++) {
         
         UIButton *btn = _btnArray[i];
         NSNumber *timeNum = times[i];
         NSString *timesStr = @"次";
         if (i >= 2) {
             timesStr = @"bpm";
         }
         NSString *timeStr = [NSString stringWithFormat:@"%d",[timeNum intValue]];
         NSString *str = [NSString stringWithFormat:@"%d%@\n%@",[timeNum intValue],timesStr,_btnValuesArray[i]];
         
         NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
         paragraphStyle.alignment = NSTextAlignmentCenter;
         paragraphStyle.lineSpacing = 12;
         
         
        //CGFloat btnWidth = (kSCREEN_WIDTH - 10*5) / 4.0;
         
         
         
         [btn setAttributedTitle:[NSString getNSMutableAttStrWithAllStr:str someStr:timeStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18],NSParagraphStyleAttributeName:paragraphStyle}] forState:UIControlStateNormal];
     }
}

- (void)refreshArrwithType:(DfthEcgRecord *)type
{
    _pvcRPeakArray = [type.pvcRPeakArray jsonStringToNSArray];
    _spRPeakArray = [type.spRPeakArray jsonStringToNSArray];
    _heartRateMaxRPeak = type.heartRateMaxRPeak;
    _heartRateMinRPeak = type.heartRateMinRPeak;
}

- (void)btnClick:(UIButton *)btn
{
    
    NSLog(@"结果页四个按钮点击btn.tag:%ld _pvcRPeakArray.count:%ld,_pvcRPeakArray:%@ _spRPeakArray.count:%ld,_spRPeakArray:%@",btn.tag,_pvcRPeakArray.count,_pvcRPeakArray,_spRPeakArray.count,_spRPeakArray);
    
    if (btn.tag == 0) { // 室性早搏
        if (_pvcRPeakArray.count == 0) {
            
            NSLog(@"室性早搏按钮点击:_pvcRPeakArray.count==0");
            return;
        }
        
        NSNumber *num =  _pvcRPeakArray[0];
        int index = [num intValue];
        if (index - 250 * 3 /2 > 0) {
            index -= 250 * 3 /2;
        }
        NSLog(@"室性早搏按钮点击:num:%@ _index==%d",num,index);
        if (self.btnClickBlock) {
            self.btnClickBlock(btn,index);
        }
        
    }else if (btn.tag == 1)
    {
        if (_spRPeakArray.count == 0) {
            NSLog(@"室上性早搏按钮点击:_spRPeakArray==0");
            return;
        }
        NSNumber *num =  _spRPeakArray[0];
        int index = [num intValue];
        if (index - 250 * 3 /2 > 0) {
            index -= 250 * 3 /2;
        }
        NSLog(@"室上性早搏按钮点击:num:%@ _index==%d",num,index);
        if (self.btnClickBlock) {
            self.btnClickBlock(btn,index);
        }
    }else if(btn.tag == ButtongMaxHeart)
    {
        if (self.btnClickBlock) {
            self.btnClickBlock(btn,_heartRateMaxRPeak);
        }
    }else if(btn.tag == ButtongMinHeart)
    {
        if (self.btnClickBlock) {
            self.btnClickBlock(btn,_heartRateMinRPeak);
        }
    }
    
    int i;
    for (i = 0; i < _btnArray.count; i++) {
        
        UIButton *_btn = _btnArray[i];
        if ([_btn isEqual:btn]) {
            
            
            _btn.layer.borderColor = _mainColor.CGColor;
            
        }else
        {
            _btn.layer.borderColor = [UIColor blackColor].CGColor;
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
