 //
//  SingleResultViewController.m
//  ThreeInOne
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "SingleResultViewController.h"

#define kNAVBAR_HEIGHT                         44
// 屏幕宽高度
#define kSCREEN_WIDTH                        [[UIScreen mainScreen] bounds].size.width
#define kSCREEN_HEIGHT                       [[UIScreen mainScreen] bounds].size.height
#define kSTATUSBAR_HEIGHT                     20

#import "WaveView.h"
#import "SportView.h"

#import <Masonry.h>

//#import ""

#define DataCountPerSecond  250 // 心仪设备每秒传过来的数据个数

#import "SingleResultDatasView.h"



#import "EcgResultSlider.h"

@interface SingleResultViewController ()
{
    WaveView *_measureView;
    UILabel *_currentMeasureTimeLbl;
    
    EcgResultSlider *_slider;
//    UISlider *_slider;
    
    UILabel *_heartNumLbl;
    UILabel *_timeLbl;
    UILabel *_stateLbl;
    
    int top;
    
    UIColor *_mainColor;
    
    SportView *_stateView;
    
    
    DfthEcgFilesReader *_fileRead;
    
    NSArray *_sportArr;
    SingleResultDatasView *_datasView;
    

    
    UIImageView *_leftImageView;
    UIImageView *_rightImageView;
    int _pvcBtnNum; // 默认0，
    int _spBtnNum; // 默认0
    NSArray<NSNumber*> *_pvcRPeakArray;
    NSArray<NSNumber*> *_spRPeakArray;

    ButtonTag _buttonTag;
    
    DfthTask *_getEcgRecordTask;
}
@end

@implementation SingleResultViewController

#pragma mark --- 测量中横竖屏相关
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_measureView removeAbserver];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"心电结果";

    [self refreshAllsubViews];
}
- (void)refreshAllsubViews
{
//    DDLogDebug(@" 心电结果页面 refreshAllsubViews: _ecgRecord:%@",_ecgRecord);
    _fileRead = [[DfthEcgFilesReader alloc] initForRecord:_ecgRecord];
    
    if (self.ecgRecord.deviceLeadCount == 1) {
        //        self.title = @"单道心电测量结果";
        _mainColor = [UIColor blueColor];
        [_measureView drawWaveWithfileReader:_fileRead adunit:81.243f];
//        [_measureView drawWaveWithDataRecord:_ecgRecord adunit:81.243f];
    }else
    {
        //        self.title = @"12导心电测量结果";
       
        _mainColor = [UIColor blueColor];
        [_measureView setShowLeadCount:3];
        _measureView.isSingle = NO;
        [_measureView drawWaveWithfileReader:_fileRead adunit:54.611668f];
//        [_measureView drawWaveWithDataRecord:_ecgRecord adunit:54.611668f];
    }
    
    [self setUIDataConfige];
}
- (void)setUIDataConfige
{
    _pvcBtnNum = 0; // 默认0，
    _spBtnNum = 0; // 默认0
    _buttonTag = -1; // 默认没有选择

    _currentMeasureTimeLbl.text = [self timestampSwitchTime:_ecgRecord.measureStartTime andFormatter:@"HH:mm:ss"];
    
    _heartNumLbl.text = [NSString stringWithFormat:@"%d",_ecgRecord.heartRateAvg];
    
    _slider.minimumValue = 0;
    _slider.value = 0;
    if (([_fileRead getEcgDataLength]) > DataCountPerSecond * _measureView.ShowSecond) {
        
         [_slider addTarget:self action:@selector(sliderChangeInSide:) forControlEvents:UIControlEventValueChanged];
        
         _slider.maximumValue = [_fileRead getEcgDataLength] - DataCountPerSecond * _measureView.ShowSecond;
       
    }else
    {
        _slider.maximumValue = 0;// 不能滑动
    }
   
    [_stateView setEcgFilesReader:_fileRead];
  
    [self updateStateWithValue:0];
    
    int64_t seconds = 0;
    if (_ecgRecord.deviceLeadCount == 1) {
        seconds = _ecgRecord.ecgDataLength / DataCountPerSecond;
    }else
    {
       seconds = _ecgRecord.ecgDataLength / DataCountPerSecond / 12;
    }
    
    NSString *timeStr = [self getStringUseEcgRecordStartTime:_ecgRecord.measureStartTime andMeasureTimes:seconds endTime:_ecgRecord.measureEndTime];
    
    NSNumber *avgHeartNum = [NSNumber numberWithInt:_ecgRecord.heartRateAvg];
    NSString *avgHeartStr = [NSString stringWithFormat:@"%@bpm",avgHeartNum];
    NSString *hearTimeStr = [NSString stringWithFormat:@"%d次",_ecgRecord.heartBeatCount];
    [_datasView setLblValue:[NSArray arrayWithObjects:timeStr,hearTimeStr,avgHeartStr, nil]];
    
    NSNumber *pvcCount = [NSNumber numberWithInt:_ecgRecord.pvcCount];
    NSNumber *spCount = [NSNumber numberWithInt:_ecgRecord.spCount];
    NSNumber *heartMax = [NSNumber numberWithInt:_ecgRecord.heartRateMax];
    NSNumber *heartMin = [NSNumber numberWithInt:_ecgRecord.heartRateMin];
    
     _pvcRPeakArray = [_ecgRecord.pvcRPeakArray jsonStringToNSArray];
    _spRPeakArray = [_ecgRecord.spRPeakArray jsonStringToNSArray];
    
    [_datasView refreshArrwithType:_ecgRecord];

    
    [_datasView setButtonTimes:[NSArray arrayWithObjects:pvcCount,spCount,heartMax,heartMin, nil]];
    
    if (([pvcCount intValue] > 0) || ([spCount intValue]> 0)) {
        [self createNextView];
    }
}
- (void)createNextView
{
    if (_leftImageView == nil) {
        UIImage *leftImage = [UIImage imageNamed:@"ecg_result_left"];
        _leftImageView = [[UIImageView alloc] init];
        [self.view addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_measureView.mas_left).offset(0);
            make.width.equalTo(@(leftImage.size.width));
            make.height.equalTo(@(leftImage.size.height));
            make.centerY.equalTo(_measureView.mas_centerY);
        }];
        _leftImageView.image = leftImage;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [tap addTarget:self action:@selector(leftImageViewTap:)];
        [_leftImageView addGestureRecognizer:tap];
        _leftImageView.userInteractionEnabled = YES;
        
        UIImage *rightImage = [UIImage imageNamed:@"ecg_result_right"];
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_measureView.mas_right).offset(0);
            make.width.equalTo(@(rightImage.size.width));
            make.height.equalTo(@(rightImage.size.height));
            make.centerY.equalTo(_measureView.mas_centerY);
        }];
        _rightImageView.image = rightImage;
        UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] init];
        [rightTap addTarget:self action:@selector(rightImageViewTap:)];
        [_rightImageView addGestureRecognizer:rightTap];
        _rightImageView.userInteractionEnabled = YES;
        
    }
    _leftImageView.hidden = YES;
    _rightImageView.hidden = YES;
   
   //    [_datasView refreshArrwithType:_ecgRecord];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    top = 0;
    [self createWaveView];
    [self createNavBarView];
}
- (void)createWaveView
{
    _measureView = [[WaveView alloc] initWithFrame:CGRectMake(0, kNAVBAR_HEIGHT+kSTATUSBAR_HEIGHT, kSCREEN_WIDTH, 300.0 / 736 * kSCREEN_HEIGHT)];
    [self.view addSubview:_measureView];
    _measureView.backgroundColor = [UIColor whiteColor];
    top += (300.0 / 736 * kSCREEN_HEIGHT+kNAVBAR_HEIGHT + kSTATUSBAR_HEIGHT) + 10;
    
    _currentMeasureTimeLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, _measureView.frame.size.height - 30, _measureView.frame.size.width, 20)];
    [_measureView addSubview:_currentMeasureTimeLbl];
    _currentMeasureTimeLbl.backgroundColor = [UIColor clearColor];
    
    _measureView.updateWaveBlock = ^(int startDataIndex)
    {
        self->_slider.value = startDataIndex;
        [self updateHeartAndState:startDataIndex];
    };
    
    _stateView = [[SportView alloc] initWithFrame:CGRectMake(10,_measureView.frame.size.height + _measureView.frame.origin.y + 10, kSCREEN_WIDTH - 20, 40 / 736.0 * kSCREEN_HEIGHT)];
    [self.view addSubview:_stateView];
    _stateLbl.backgroundColor = [UIColor redColor];
    if (self.ecgRecord.deviceLeadCount == 1) {
        _stateView.backgroundColor = [UIColor blueColor];
    }else
    {
        _stateView.backgroundColor = [UIColor blueColor];
    }
    top += 40 / 736.0 * kSCREEN_HEIGHT + 10;
    
     _slider = [[EcgResultSlider alloc] init];
//    _slider = [[UISlider alloc] init];
    [self.view addSubview:_slider];
    [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@5);
        make.top.equalTo(_stateView.mas_bottom).offset(20 / 736.0 * kSCREEN_HEIGHT);
    }];
//    _slider.userInteractionEnabled = NO;
//    _slider.backgroundColor = [UIColor redColor];
    top+= 15;
    
    _slider.minimumTrackTintColor = _mainColor;
    _slider.maximumTrackTintColor = [UIColor lightGrayColor];
    UIImage *image;
    //= [self createCircleColor:kMainColor Size:CGSizeMake(15, 15)];
    [_slider setThumbImage:image forState:UIControlStateNormal];
//    _slider.maximumValue = 100; // 时间最大值
//    _slider.minimumValue = 0;
//    _slider.value = 50; // 当前值
    
    UIImageView *heartImageView = [[UIImageView alloc] init];
    [self.view addSubview:heartImageView];
    [heartImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@20);
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(_slider.mas_bottom).offset(10);
    }];
    heartImageView.image = [UIImage imageNamed:@"perMess_myservice"];
     top+= 10;
    
    _heartNumLbl = [[UILabel alloc] init];
    [self.view addSubview:_heartNumLbl];
    [_heartNumLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(heartImageView.mas_right);
        make.width.equalTo(@40);
        make.top.equalTo(heartImageView.mas_top);
        make.bottom.equalTo(heartImageView.mas_bottom);
    }];
    _heartNumLbl.text = @"0";
    _heartNumLbl.font = [UIFont systemFontOfSize:16];
    _heartNumLbl.textAlignment = NSTextAlignmentCenter;
//    _heartNumLbl.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *bpmLbl = [[UILabel alloc] init];
    [self.view addSubview:bpmLbl];
    [bpmLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_heartNumLbl.mas_right);
        make.bottom.equalTo(_heartNumLbl.mas_bottom);
        make.height.equalTo(@20);
        make.width.equalTo(@30);
    }];
//    bpmLbl.backgroundColor = [UIColor yellowColor];
    bpmLbl.text = @"bpm";
    bpmLbl.font = [UIFont systemFontOfSize:14];
    
    _timeLbl = [[UILabel alloc] init];
    [self.view addSubview:_timeLbl];
    [_timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40 / 736.0 * kSCREEN_HEIGHT));
        make.centerY.equalTo(heartImageView.mas_centerY);
        make.width.equalTo(@100);
    }];
    top+= 40 / 736.0 * kSCREEN_HEIGHT - 5; // 因为 centerY.equalTo(heartImageView.mas_centerY); 比heartImageView高5厘米，而这5里面包含在 make.top.equalTo(_slider.mas_bottom).offset(10);里面
//    _timeLbl.backgroundColor = [UIColor lightGrayColor];
    _timeLbl.text = @"00:00:00";
    _timeLbl.textAlignment = NSTextAlignmentRight;
//    _timeLbl.backgroundColor = [UIColor redColor];
    
    
    _stateLbl = [[UILabel alloc] init];
    [self.view addSubview:_stateLbl];
    [_stateLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bpmLbl.mas_right);
        make.right.equalTo(_timeLbl.mas_left);
        make.height.equalTo(_timeLbl.mas_height);
        make.centerY.equalTo(_timeLbl.mas_centerY);
    }];
    _stateLbl.text = @"平静状态";
    _stateLbl.textAlignment = NSTextAlignmentCenter;
    if(_ecgRecord.deviceLeadCount == 1)
    {
        _stateLbl.textColor = [UIColor blueColor];
    }else
    {
       _stateLbl.textColor = [UIColor blueColor];
    }
    
    _stateLbl.font = [UIFont systemFontOfSize:16];
    if (_ecgRecord.deviceLeadCount == 12) {
        _stateLbl.hidden = YES;
    }else
    {
        _stateLbl.hidden = NO;
    }
}
- (void)createNavBarView
{
    UIColor *mainColor;
    if(self.ecgRecord.deviceLeadCount == 1)
    {
        mainColor = [UIColor blueColor];
    }else
    {
       mainColor = [UIColor blueColor];
    }
    
    
    _datasView = [[SingleResultDatasView alloc] initWithHeight:(kSCREEN_HEIGHT - top) withType:_ecgRecord];
    
    [self.view addSubview:_datasView];
    [_datasView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_titleView.mas_bottom);
        make.top.equalTo(_timeLbl.mas_bottom).offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

    _datasView.btnClickBlock = ^(UIButton *btn,int index)
    {
//        @strongify(self);
        _buttonTag = btn.tag;
        
        if (btn.tag == 0) {
            
            _pvcBtnNum = 0;
            if (_pvcRPeakArray.count > 1) {
                
                
                self->_leftImageView.hidden = YES;
                self->_rightImageView.hidden = NO;
            }
            
        }else if (btn.tag == 1)
        {
            _spBtnNum = 0;
            if (_spRPeakArray.count > 1) {

                self->_leftImageView.hidden = YES;
                self->_rightImageView.hidden = NO;
            }
        }else
        {
            self->_leftImageView.hidden = YES;
            self->_rightImageView.hidden = YES;
            
        }
        
        NSLog(@"createNavBarView  --- refreshWaveSportSliderHeart");
        [self refreshWaveSportSliderHeart:index];
    };
    
    BOOL isSingle = self.ecgRecord.deviceLeadCount == 1 ? YES : NO;
    
    
}

#pragma mark -- 用户交互事件
- (void)sliderChangeInSide:(UISlider *)slider
{
 
//    NSLog(@"slider.max %f slider.min:%f",_slider.maximumValue,_slider.minimumValue);
    
    [_measureView StartUpdateWaveStartDataNum:slider.value];
    
//    [_stateView setPathDatValue:slider.value];
    
    [self updateHeartAndState:slider.value];
    
}
- (void)updateHeartAndState:(CGFloat)value
{
    NSInteger hour = 0;
    NSInteger min = 0;
    NSInteger second = 0;
    NSInteger times = 0;
    NSInteger currentTimes = _ecgRecord.measureStartTime;
    
    if (_ecgRecord.measureEndTime > 0) {
//        times =  _ecgRecord.measureEndTime - _ecgRecord.measureStartTime - 3;
        if (_ecgRecord.deviceLeadCount == 1) {
            times = _ecgRecord.ecgDataLength / DataCountPerSecond;
        }else
        {
            times = _ecgRecord.ecgDataLength / DataCountPerSecond / 12;
        }
        
        if (times == 0) {
            times =  _ecgRecord.measureEndTime - _ecgRecord.measureStartTime;
        }
        
        times -= 3;
        times = times / (_slider.maximumValue) * _slider.value;
        currentTimes += times;
        
        second = times % 60;
        min = times / 60;
        hour =  min / 60;
        min %= 60;
    }

    _timeLbl.text = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld",(long)hour,(long)min,(long)second];
    
    _currentMeasureTimeLbl.text = [self timestampSwitchTime:currentTimes andFormatter:@"HH:mm:ss"];
//    
     NSArray<ECGStorageResult*> *datArr = [_fileRead getDatDataFrom:(int)value ofLength:600];

    if (datArr.count > 0) {
        
        ECGStorageResult *result = datArr[0];
//        if (result.HeartRate == 0) {
//             _heartNumLbl.text = [NSString stringWithFormat:@"0"];
//        }else{
          _heartNumLbl.text = [NSString stringWithFormat:@"%d",result.HeartRate];
//        }
    }
//
   
    [self updateStateWithValue:value];
}
- (void)updateStateWithValue:(CGFloat)value
{
    int state = [_stateView setPathDatValue:value];
    
    if (_ecgRecord.deviceLeadCount == 1) {
        if (state == 100) {
            _stateLbl.text = [NSString stringWithFormat:@"缓慢运动"];
            _stateLbl.textColor = [self colorWithHexString:@"#f8bb3a"];
        }else if (state == 200) {
            _stateLbl.text = [NSString stringWithFormat:@"剧烈运动"];
            _stateLbl.textColor = [self colorWithHexString:@"#ff6b0a"];
        }else if (state == 0){
            _stateLbl.text = [NSString stringWithFormat:@"平静状态"];
            _stateLbl.textColor = [UIColor blueColor];
        }
    }
   
}

#pragma mark -- 室（上）性早搏 ，心率按钮点击事件以及上一张图下一张图点击事件
- (void)sliderTapViewTap:(UITapGestureRecognizer *)tap
{
    CGPoint tapPoint = [tap locationInView:self.view];
    NSLog(@"tapPointX:%f tapPointy:%f",tapPoint.x ,tapPoint.y);
}
- (void)leftImageViewTap:(UITapGestureRecognizer *)tap
{
    NSNumber *num;
    if (_buttonTag == ButtongPVC) {
        _pvcBtnNum--;
        _rightImageView.hidden = NO;
        if (_pvcBtnNum == 0) {
            _leftImageView.hidden = YES;
        }
        num =  _pvcRPeakArray[_pvcBtnNum];
    }else if (_buttonTag == ButtongSP)
    {
        _spBtnNum--;
        _rightImageView.hidden = NO;
        if (_spBtnNum == 0) {
            _leftImageView.hidden = YES;
        }
        num =  _spRPeakArray[_spBtnNum];
    }
    int index = [num intValue];
    if (index - 250 * 3 /2 > 0) {
        index -= 250 * 3 /2;
    }
    NSLog(@" leftImageViewTap 刷新起始位置：num:%@ %d _pvcBtnNum：%d _spBtnNum:%d _pvcRPeakArray.count:%ld _pvcRPeakArray：%@ _spRPeakArray.count:%ld _spRPeakArray:%@",num,index,_pvcBtnNum,_spBtnNum,_pvcRPeakArray.count,_pvcRPeakArray,_spRPeakArray.count,_spRPeakArray);
    [self refreshWaveSportSliderHeart:index];
}
- (void)rightImageViewTap:(UITapGestureRecognizer *)tap
{
    NSNumber *num;
    if (_buttonTag == ButtongPVC) {
        
        _pvcBtnNum++;
        _leftImageView.hidden = NO;
        if (_pvcBtnNum + 1 ==  _pvcRPeakArray.count) {
            _rightImageView.hidden = YES;
        }
        num =  _pvcRPeakArray[_pvcBtnNum];
    }else if (_buttonTag == ButtongSP)
    {
        _spBtnNum++;
        _leftImageView.hidden = NO;
        if (_spBtnNum + 1 ==  _spRPeakArray.count) {
            
            _rightImageView.hidden = YES;
        }
        num =  _spRPeakArray[_spBtnNum];
        
    }
    int index = [num intValue];
    if (index - 250 * 3 /2 > 0) {
        index -= 250 * 3 /2;
    }
    NSLog(@" rightImageViewTap 刷新起始位置：num:%@ %d _pvcBtnNum：%d _spBtnNum:%d _pvcRPeakArray.count:%ld _pvcRPeakArray：%@ _spRPeakArray.count:%ld _spRPeakArray:%@",num,index,_pvcBtnNum,_spBtnNum,_pvcRPeakArray.count,_pvcRPeakArray,_spRPeakArray.count,_spRPeakArray);
    
    [self refreshWaveSportSliderHeart:index];
}


- (void)refreshWaveSportSliderHeart:(int)index
{
    _slider.value = index;
    [self updateHeartAndState:index];
    [_measureView StartUpdateWaveStartDataNum:index];
}

-(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY.MM.dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}

- (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

// 创建一个实心圆
+ (UIImage *)createCircleColor:(UIColor *)color Size:(CGSize)size
{
    CGRect rect = CGRectMake(0.5, 0.5, size.width-1 , size.height-1 );
    
    UIGraphicsBeginImageContextWithOptions(size, NO,[UIScreen mainScreen].scale);
    //    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5f);
    
    CGContextAddEllipseInRect(context, rect);
    [color set];
    
    CGContextFillPath(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

- (NSString *)stringFromDate:(NSDate*)date format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)getStringUseEcgRecordStartTime:(int64_t)startTime andMeasureTimes:(int64_t)measureTimes endTime:(int64_t)endTime
{
    NSString *startTimeStr = [self stringFromDate:[NSDate dateWithTimeIntervalSince1970:startTime] format:@"yyyy.MM.dd HH:mm:ss"];
    
    NSInteger hour = 0;
    NSInteger min = 0;
    NSInteger second = 0;
    int64_t times;
    if (measureTimes == 0) {
        times =  endTime - startTime;
    }else
    {
        times = measureTimes;
    }
    
    second = times % 60;
    
    min = times / 60 ;
    hour =  min / 60;
    min %= 60;
    
    if (hour > 0) {
        return [NSString stringWithFormat:@"%@( %ldh %ldm %lds )",startTimeStr,hour,min,second];
        //        self.timeLabl.text = [NSString stringWithFormat:@"%@( %ldh %ldm %lds )",startTime,hour,min,second];
        
    }else if (min > 0)
    {
        return [NSString stringWithFormat:@"%@( %ldm %lds )",startTimeStr,min,second];
        //        self.timeLabl.text = [NSString stringWithFormat:@"%@( %ldm %lds )",startTime,min,second];
    }else if (second > 0)
    {
        return [NSString stringWithFormat:@"%@( %lds )",startTimeStr,second];
        //        self.timeLabl.text = [NSString stringWithFormat:@"%@( %lds )",startTime,second];
    }else
    {
        return [NSString stringWithFormat:@"%@(0 s)",startTimeStr];
        //        self.timeLabl.text = [NSString stringWithFormat:@"%@( )",startTime];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#ifndef    weakify
#if __has_feature(objc_arc)

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")

#else

#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")

#endif
#endif

#ifndef    strongify
#if __has_feature(objc_arc)

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")

#else

#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")

#endif
#endif


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
