//
//  WaveView.m
//  BlueToothDemo
//
//  Created by admin on 2017/1/4.
//  Copyright © 2017年 com.dfth.BlueToothDemo. All rights reserved.
//

#import "WaveView.h"
#import "UIView+Category.h"
#import "NSString+Extra.h"

// 屏幕宽高度
#define kSCREEN_WIDTH                        [[UIScreen mainScreen] bounds].size.width
#define kSCREEN_HEIGHT                       [[UIScreen mainScreen] bounds].size.height
#define DataCountPerSecond  250 // 心仪设备每秒传过来的数据个数

#define leadeLength  12   // 12导
#define SmallGridCountPerBigGrid 5 // 每大格有多少小格
#define SmallGridYMV  0.1 // 每一个小格代表0.1MV
#define BigGridYMV   SmallGridCountPerBigGrid * SmallGridYMV  // 每一个大格有多少MV

#define DataCountPerDatas 50  // 每一个传50个数据，12导则传 12* 50个数据

//#define RereshShow 10 // 画笔效果宽度

#define RereshShow 3 // 画笔效果宽度

//#define ShowSecond  3.0f // 默认显示3秒数据

//#define WaveStartX  _PerBigGridWidth

@interface WaveView()
{
    float _PerSmallGridWidth; // 每小格的宽度
    float _PerSmallGridHeight; // 每小格的高度
    float _PerBigGridWidth; // 每大格的宽度
    float _PerBigGridHeight; // 每大格的高度
    float _PerDataWidth;  // 每个数据占的宽度
    
    CGPoint _curPos[leadeLength]; // 心电图当前画到的点位置
    CGFloat _baseLineY[leadeLength]; // 每个导的屏幕位置基线
    CGFloat _baseLineYMV[leadeLength]; // 每个导的屏幕位置基线 上代表的电压值
    
    NSArray *_data; // 数据数组
    NSInteger _dataLen; // 数据长度
    CGFloat _adunit; // ad电化量瓶
    
     // 只跟详情相关
   int _curDataNums; // 画到第几个数据
    CGFloat _startTouchX; // 开始移动的点
    DfthEcgFilesReader *_fileRead;
    
    CGFloat _MaxDataNums;
    NSArray<ECGStorageResult*> *_datArr;
    
    NSMutableArray *_showLeads;
    
    CGFloat WaveStartX;
    
    CGPoint currentPoint[12];
     CGPoint lastPoint[12];
    
    BOOL isMeasuring; // 是否是实时测量
    
    NSNotificationCenter *Center;
//    CGFloat ShowSecond;
}
@end


@implementation WaveView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setDefaultValue];
        [self initLeadCountConfig:_showLeadCount];
        self.userInteractionEnabled = NO;
        NSLog(@" initWithFrame");
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setDefaultValue];
        [self initLeadCountConfig:_showLeadCount];
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)addAbserver
{
    if (Center == nil) {
        Center = [NSNotificationCenter defaultCenter];
        [Center addObserver:self selector:@selector(appDidBecomeActive:) name:@"ApplicationDidBecomeActive" object:nil];
         NSLog(@" 画图View 添加通知");
    }
    
}
- (void)removeAbserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@" 画图View 移除通知");
}

- (void)appDidBecomeActive:(NSNotification *)notif
{
    
    NSLog(@"appDidBecomeActive ");

    if (_fileRead == nil) { // 说明是实时化图
        
        NSLog(@"画图View 收到进入前台通知 ");
        [self setWidthHeightConfig];
        [self initLeadCountConfig:_showLeadCount];
        [self setNeedsDisplay];
        
    }
}
- (void)setShowLeadCount:(int)showLeadCount // 设置显示导联数
{
    if (showLeadCount >= 1) {
        
        _showLeadCount = showLeadCount;
        [self initLeadCountConfig:_showLeadCount];
        
        _showLeads = [[NSMutableArray alloc] init];
        for (int i = 0; i < showLeadCount; i++) {
            [_showLeads addObject:@(i)];
        }
    }
    
}
- (void)initLeadCountConfig:(int)showLeadCount
{

    NSLog(@"周素华 initLeadCountConfig");
    for (int i = 0; i < showLeadCount; i++) {
        // 设置心电图的起始位置
        _curPos[i].x = WaveStartX;
//        _curPos[i].y = 0;
        
        // 设置每个导的基线Y值
        _baseLineY[i] = [self getHeigth] / (showLeadCount + 1) * (i + 1); // 单道基线的Y值
        _curPos[i].y = _baseLineY[i];

    }
}


- (void)setOrientation:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown) {
        
        _ShowSecond = 3;
    }else if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        _ShowSecond = 5;
    }

    [self setWidthHeightConfig];
    [self initLeadCountConfig:_showLeadCount];
    if (isMeasuring == NO) {
        [self setNeedsDisplay];
        NSLog(@"  isMeasuring == NO ");
    }
}
- (void)setDefaultValue
{
    isMeasuring = NO;
    _PerBigGridWidth = 0;
    _isSingle = YES;
    _ShowSecond = 3;
//    _showLeadCount = 1; // 默认显示单道
    self.showLeadCount = 1;
    [self setWidthHeightConfig];
    NSLog(@"周素华 setDefaultValue");
}
- (void)setWidthHeightConfig
{
    //每秒的宽度
    CGFloat perSecondWidth = [self getWidth] / _ShowSecond;
    //    0.2秒是一个大格
    _PerBigGridWidth = perSecondWidth / 5;
    _PerBigGridHeight = _PerBigGridWidth;
    
    // 每小格宽度
    _PerSmallGridWidth = _PerBigGridWidth / SmallGridCountPerBigGrid;
    _PerSmallGridHeight = _PerSmallGridWidth;
    
    // 每个数据占的宽度
    _PerDataWidth = [self getWidth] / _ShowSecond / DataCountPerSecond;
    
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
//    NSLog(@"周素华  drawRect rect.x:%f  _dataLen:%ld _showLeadCount:%d _data:%@",rect.origin.x,(long)_dataLen,_showLeadCount,_data);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
 
    CGContextSetBlendMode(context,kCGBlendModeDarken);
    [self drawEcgGrid:context rect:rect]; // 重绘网格
    [self drawText:context rect:CGRectMake(0, 10, kSCREEN_WIDTH, kSCREEN_HEIGHT)];

    [self drawLead:context rect:(CGRectMake(0, 0, _PerBigGridWidth, kSCREEN_HEIGHT))];
    
    
    CGPoint p[2] = {0};

    int n = _isSingle ? 1 : 12;
    
        for (int dataNum = 0; dataNum < _dataLen ; dataNum++) {
            CGContextSetStrokeColorWithColor(context,  [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8].CGColor);
            for (int Group = 0; Group < _showLeadCount; Group++) { // 显示几组
        
                CGFloat NewDataX = _curPos[Group].x + _PerDataWidth;
                // 新数据毫伏值
//                CGFloat NewDataMV = ([_data[dataNum*n + Group] floatValue] / _adunit);
                CGFloat NewDataMV = ([_data[dataNum*n + [_showLeads[Group] integerValue]] floatValue] / _adunit);
                // 相差多少个小格数量
                CGFloat SmallGridCount = (_baseLineYMV[Group]-NewDataMV) / SmallGridYMV;
                    
                // 相差的像素
                CGFloat NewDataY = SmallGridCount * _PerSmallGridHeight + _baseLineY[Group];
                
                        if (dataNum == 0) {
                
                            currentPoint[Group] = _curPos[Group];
                            
                            if (_curPos[Group].x != WaveStartX) {
                                ///////
                                p[0] = lastPoint[Group];
                                p[1] = currentPoint[Group];
                                CGContextAddLines(context, p, 2);
                                CGContextStrokePath(context);
                                ///////
                            }
                            
                        }else
                        {
                            p[0] = currentPoint[Group];
                            p[1] = CGPointMake(NewDataX, NewDataY);
                            
                            CGContextAddLines(context, p, 2);
                            CGContextStrokePath(context);
                            currentPoint[Group] = p[1];
                            if (dataNum > _dataLen - 10) {
                                
//                            NSLog(@"最后10个点: dataNum:%d p[1].x:%f",dataNum,p[1].x);
                                
                            }
                            ///////
                            if (dataNum == _dataLen - 2) {
                                
                                lastPoint[Group] = currentPoint[Group];
                            }
                            ///////
                            
                        }
                        _curPos[Group].x = NewDataX;
                        _curPos[Group].y = NewDataY;
                
               
            }
            [self drawNSV:context rect:rect dataNUm:dataNum];
    }
    
}
- (void)drawLead:(CGContextRef)context rect:(CGRect)rect
{
    
     CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    int height = round(([self getHeigth]/_PerBigGridHeight) / 2 + 5);
//    int height = [self getHeigth] / 2;
    CGContextMoveToPoint(context, 0, (height - 2)*_PerBigGridHeight);
    CGContextAddLineToPoint(context, 1.6*_PerSmallGridWidth,(height - 2)*_PerBigGridHeight);
    CGContextAddLineToPoint(context, 1.6*_PerSmallGridWidth, (height - 4)*_PerBigGridHeight);
    CGContextAddLineToPoint(context, 3.4*_PerSmallGridWidth, (height - 4)*_PerBigGridHeight);
    CGContextAddLineToPoint(context, 3.4*_PerSmallGridWidth, (height - 2)*_PerBigGridHeight);
    CGContextAddLineToPoint(context, 5*_PerSmallGridWidth,  (height - 2)*_PerBigGridHeight);
    CGContextStrokePath(context);
    
    if (!_isSingle)
    {
        NSArray *titleArr = [NSArray arrayWithObjects:@"I",@"II",@"III",@"avR",@"avL",@"avF",@"V1",@"V2",@"V3",@"V4",@"V5",@"V6",nil];
        for (int Group = 0; Group < _showLeadCount; Group++) { // 显示几组
            
            CGRect newRect = rect;
            newRect.origin.y = _baseLineY[Group] - 5;
            
            NSInteger titleIndex = [_showLeads[Group] integerValue];
            
            NSString *textOne = titleArr[titleIndex];
            NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            paragraphStyle.alignment = NSTextAlignmentCenter;
            paragraphStyle.lineSpacing = 6;
            [textOne drawInRect:newRect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                                         NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:paragraphStyle}];
            
        }
    }
}
- (void)drawText:(CGContextRef)context rect:(CGRect)rect
{
    CGRect newRect = rect;
    newRect.origin.x = rect.size.width - 60;
    newRect.size.width -= 10;
    NSString *textOne = @"增益:10mm/mv\n走速:25mm/s";
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 6;
    [textOne drawInRect:newRect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8],
                                              NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:paragraphStyle}];
}
- (void)drawNSV:(CGContextRef)context rect:(CGRect)rect dataNUm:(int)dataNum
{
    
    for (ECGStorageResult *result in _datArr) {
        
        if (result.R_peak - _curDataNums== dataNum) {
            
            CGFloat datX = currentPoint[0].x;
            
            CGRect newRect = rect;
            newRect.origin.x = datX;
            newRect.size.height = _PerSmallGridHeight * 4;
            
            NSString *textOne;
            UIColor *textOnecolor = [UIColor blackColor];
            if (result.Classify == 0) {
                
                textOne = @"N";
                
            }else if(result.Classify == 1)
            {
               textOne = @"V"; //
                textOnecolor = [self colorWithHexString:@"#e93222"];
                
            }else if(result.Classify == 2)
            {
                textOne = @"S";
                textOnecolor = [self colorWithHexString:@"#0000ff"];
            }else if(result.Classify == -3)
            {
                textOne = @"X";
                textOnecolor = [self colorWithHexString:@"#ff33cc"];
            }
            
            int size = 22 / 736.0 * kSCREEN_HEIGHT;
            // 将字在中间显示
            CGFloat width = [textOne widthOfFont:[UIFont systemFontOfSize:size]];
            newRect.origin.x -= width / 2;
            
            NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            paragraphStyle.alignment = NSTextAlignmentLeft;
            [textOne drawInRect:newRect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],
                                                         NSForegroundColorAttributeName:textOnecolor,NSParagraphStyleAttributeName:paragraphStyle}];
            
        }

    }
}
// 绘制网格
- (void)drawEcgGrid:(CGContextRef)context rect:(CGRect)rect
{
    CGFloat line_X = _curPos[0].x;;
    if (rect.origin.x == 0) {
        line_X = rect.origin.x;
    }
    // 线的Y轴
    CGFloat line_Y = rect.origin.y;
    // 画网格的纵轴
    for (CGFloat bigX = line_X; bigX < (rect.origin.x + rect.size.width) ; bigX += _PerBigGridWidth) {

        // 小格
        for (CGFloat smallX = bigX; smallX < (bigX+ _PerBigGridWidth) ; smallX += _PerSmallGridWidth) {

            [self DrawSmallGridVerticalLine:context x:smallX rect:rect];
        }

        [self DrawBigGridVerticalLine:context x:bigX rect:rect];
    }
    
    // 画网格的横轴
    for (CGFloat bigY = line_Y; bigY < (rect.origin.y + rect.size.height) ; bigY += _PerBigGridHeight) {
        // 小格
        
        for (CGFloat smallY = bigY; smallY < (bigY+ _PerBigGridHeight) ; smallY += _PerSmallGridHeight) {
            
            [self DrawSmallGridHorizontalLine:context y:smallY rect:rect];
        }
        [self DrawBigGridHorizontalLine:context y:bigY rect:rect];
    }
}
- (void)DrawSmallGridVerticalLine:(CGContextRef)context x:(CGFloat)smallX rect:(CGRect)rect
{
//    CGContextSetLineWidth(context, 0.1);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f green:0.0f blue:0.0f alpha:0.15].CGColor);
    CGContextMoveToPoint(context, smallX, rect.origin.y);
    CGContextAddLineToPoint(context, smallX, rect.origin.y+rect.size.height);
    CGContextStrokePath(context);
}
- (void)DrawSmallGridHorizontalLine:(CGContextRef)context y:(CGFloat)smallY rect:(CGRect)rect
{
//     CGContextSetLineWidth(context, 0.1);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f green:0.0f blue:0.0f alpha:0.15].CGColor);
    CGContextMoveToPoint(context,rect.origin.x,smallY);
    CGContextAddLineToPoint(context,rect.origin.x+rect.size.width, smallY);
    CGContextStrokePath(context);
}
- (void)DrawBigGridVerticalLine:(CGContextRef)context x:(CGFloat)bigX rect:(CGRect)rect
{
//     CGContextSetLineWidth(context, 0.2);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f green:0.0f blue:0.0f alpha:0.25].CGColor);
    CGContextMoveToPoint(context, bigX, rect.origin.y);
    CGContextAddLineToPoint(context, bigX, rect.origin.y+rect.size.height);
    CGContextStrokePath(context);
}
- (void)DrawBigGridHorizontalLine:(CGContextRef)context y:(CGFloat)bigY rect:(CGRect)rect
{
//     CGContextSetLineWidth(context, 0.1);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:255.0f green:0.0f blue:0.0f alpha:0.25].CGColor);
    CGContextMoveToPoint(context, rect.origin.x, bigY);
    CGContextAddLineToPoint(context, rect.origin.x+rect.size.width,bigY);
    CGContextStrokePath(context);
}
- (void)drawWave:(NSArray *)data dataLen:(NSInteger)dataLen adunit:(float)adunit
{
    
    
    isMeasuring = YES;
    
    _adunit = adunit;
    _data = data;
    
    CGRect dirt2;
    
    int n = _isSingle ? 1 : 12;
    _dataLen = dataLen / n;
    
    _curDataNums += _dataLen;
    _datArr = [_fileRead getDatDataFrom:_curDataNums ofLength:(int)_dataLen];
    
     [self setcurPosAndBaseline];
  
//    NSLog(@"drawWave:_curPos[0].x:%f",_curPos[0].x);
    
    dirt2 = CGRectMake(_curPos[0].x, 0, _PerBigGridWidth + RereshShow, [self getHeigth]);
    
//    NSLog(@"  setNeedsDisplayInRect ");
    [self setNeedsDisplayInRect:dirt2];
    
    
}

- (void)drawWaveWithfileReader:(DfthEcgFilesReader *)filereader adunit:(float)adunit
{
    self.userInteractionEnabled = YES;
    _adunit = adunit;
    _MaxDataNums = 0;
    _fileRead = filereader;
//    _fileRead = [[DfthEcgFilesReader alloc] initForRecord:record];
    
    _curDataNums = 0;
    
    _dataLen = DataCountPerSecond*_ShowSecond;
    
    [self StartUpdateWaveStartDataNum:_curDataNums];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    UITouch *touch = [touches anyObject];
    CGPoint cur = [touch locationInView:self];
    _startTouchX = cur.x;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint cur = [touch locationInView:self];
    float d = cur.x - _startTouchX;
    
    if (fabsf(d) > 5) {
        
        _curDataNums += d > 0 ? -DataCountPerDatas : DataCountPerDatas;
        _curDataNums = _curDataNums <0 ? 0 : _curDataNums;
        _startTouchX = cur.x;
        
        if (self.updateWaveBlock) {
            self.updateWaveBlock(_curDataNums);
        }
        
        [self StartUpdateWaveStartDataNum:_curDataNums];
    }
}
- (void)StartUpdateWaveStartDataNum:(int)StartDataIndex
{
//    float avg = 0 ;
    int n = _isSingle ? 1 : 12;
    
    _curDataNums = StartDataIndex;
    
    
    _datArr = [_fileRead getDatDataFrom:_curDataNums ofLength:(int)_dataLen];

 
    _data = [_fileRead getEcgDataFrom:_curDataNums ofLength:(int)_dataLen];
    
 
    
    if (_data.count < _dataLen*n && _curDataNums != 0) {
        
        if (_data.count == 0) {
            
            return;
        }
        
        _curDataNums = (int)(_curDataNums - (_dataLen*n - _data.count)/n);

       _data = [_fileRead getEcgDataFrom:_curDataNums ofLength:(int)_dataLen];
        
    }
    _dataLen = _data.count / n;
    
    for (int Group = 0; Group < _showLeadCount; Group++){
        _curPos[Group].x = WaveStartX;
    }
    
     [self setcurPosAndBaseline];

    [self setNeedsDisplay];
}
- (void)removeAllHeartWave
{
     for (int Group = 0; Group < _showLeadCount; Group++){
     _curPos[Group].x = WaveStartX;
      }
     _dataLen = 0;
    
     isMeasuring = NO;
    
    NSLog(@"  removeAllHeartWave --");
     [self setNeedsDisplayInRect:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];

    if (_isSingle) {
        self.showLeadCount = 1;
    }else
    {
      self.showLeadCount = 3;
    }
    
   
//    [_showLeads removeAllObjects];
}

- (void)setShowLeadNum:(NSInteger)leadNum;
{
    
//    BOOL isExist = false;
    
    NSNumber *num = [NSNumber numberWithInteger:leadNum];
    
    if ([_showLeads containsObject:num]) {
        [_showLeads removeObject:num];
    }else
    {
        [_showLeads addObject:num];
    }
    
    NSSortDescriptor *sortDes1 =[[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    [_showLeads sortUsingDescriptors:@[sortDes1]];
 
    
    _showLeadCount = (int)_showLeads.count;
    
 
    
    [self initLeadCountConfig:_showLeadCount];

    [self setcurPosAndBaseline];
    
    NSLog(@"  setShowLeadNum --");
    [self setNeedsDisplay];
    
}
- (void)setcurPosAndBaseline
{
     for (int Group = 0; Group < _showLeadCount; Group++){
        
        if (ceil(_curPos[Group].x) >= ceil([self getWidth])) {
            _curPos[Group].x = WaveStartX;
        }
        
        if (_curPos[Group].x == WaveStartX) {
            
            
//            CGFloat avg = 0 ;
//            for (int dataNum = 0; dataNum < DataCountPerDatas ; dataNum++) {
//               
//                avg+=  [_data[dataNum*n + [_showLeads[Group] integerValue]] floatValue] / _adunit;
//            }
//            _baseLineYMV[Group]=avg/DataCountPerDatas;
            _baseLineYMV[Group] = 0;
        }
    }
}

- (void)setIsSingle:(int)isSingle
{
    _isSingle = isSingle;
    WaveStartX = _PerBigGridWidth;
    NSLog(@"WaveStartx:%f",WaveStartX);
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

@end
