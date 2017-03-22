//
//  WaveView.m
//  BlueToothDemo
//
//  Created by admin on 2017/1/4.
//  Copyright © 2017年 com.dfth.BlueToothDemo. All rights reserved.
//

#import "WaveView.h"
#import "UIView+Category.h"

#define leadeLength  12   // 12导

#define ShowSecond  3.0f // 默认显示3秒数据
#define DataCountPerSecond  250 // 心仪设备每秒传过来的数据个数
#define SmallGridCountPerBigGrid 5 // 每大格有多少小格
#define SmallGridYMV  0.1 // 每一个小格代表0.1MV
#define BigGridYMV   SmallGridCountPerBigGrid * SmallGridYMV  // 每一个大格有多少MV

#define DataCountPerDatas 50  // 每一个传50个数据，12导则传 12* 50个数据

#define RereshShow 10 // 画笔效果宽度

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
    NSInteger _curDataNums; // 画到第几个数据
    CGFloat _startTouchX; // 开始移动的点
    DfthEcgFilesReader *_fileRead;
    
    CGFloat _MaxDataNums;
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
    }
    return self;
}
- (void)setShowLeadCount:(int)showLeadCount // 设置显示导联数
{
    if (showLeadCount >= 1) {
        
        _showLeadCount = showLeadCount;
        [self initLeadCountConfig:_showLeadCount];
    }
    
}
- (void)initLeadCountConfig:(int)showLeadCount
{
    for (int i = 0; i < showLeadCount; i++) {
        // 设置心电图的起始位置
        _curPos[i].x = 0;
        _curPos[i].y = 0;
        
        // 设置每个导的基线Y值
        _baseLineY[i] = [self getHeigth] / (showLeadCount + 1) * (i + 1); // 单导基线的Y值
    }
}


- (void)setOrientation:(UIInterfaceOrientation)orientation
{
    [self setDefaultValue];
    [self initLeadCountConfig:_showLeadCount];
}
- (void)setDefaultValue
{
    _isSingle = YES;
    _showLeadCount = 1; // 默认显示单导
    //每秒的宽度
    CGFloat perSecondWidth = [self getWidth] / ShowSecond;
    //    0.2秒是一个大格
    _PerBigGridWidth = perSecondWidth / 5;
    _PerBigGridHeight = _PerBigGridWidth;
    
    // 每小格宽度
    _PerSmallGridWidth = _PerBigGridWidth / SmallGridCountPerBigGrid;
    _PerSmallGridHeight = _PerSmallGridWidth;
    
    // 每个数据占的宽度
    _PerDataWidth = [self getWidth] / ShowSecond / DataCountPerSecond;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawEcgGrid:context rect:rect]; // 重绘网格
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGPoint currentPoint[12] = {0};
    CGPoint p[2] = {0};
    
//    int n = _dataLen>50?12:1;
    int n = _isSingle ? 1 : 12;
    
        for (int dataNum = 0; dataNum < _dataLen / n ; dataNum++) {
            
                for (int Group = 0; Group < _showLeadCount; Group++) { // 显示几组
                    
                CGFloat NewDataX = _curPos[Group].x + _PerDataWidth;
                    
                // 新数据毫伏值
                CGFloat NewDataMV = ([_data[dataNum*n + Group] floatValue] / _adunit);
                // 相差多少个小格数量
                CGFloat SmallGridCount = (_baseLineYMV[Group]-NewDataMV) / SmallGridYMV;
                    
                // 相差的像素
                CGFloat NewDataY = SmallGridCount * _PerSmallGridHeight + _baseLineY[Group];
//                    NSLog(@"dataNum::%d group:%d --_baseLineYMV[Group]::%f,_baseLineY[Group]:%f  NewDataX：：：%f ,data:%f , NewDataMV::%f NewDataY:::%f,SmallGridCount::%f",dataNum*n + Group,Group,_baseLineYMV[Group],_baseLineY[Group],NewDataX,[_data[dataNum*n + Group] floatValue],NewDataMV,NewDataY,SmallGridCount);
                    
                        if (dataNum == 0) {
                            currentPoint[Group] = CGPointMake(0, NewDataY);
                            CGContextMoveToPoint(context, 0, _baseLineY[Group]);
                        }else
                        {
                            p[0] = currentPoint[Group];
                            p[1] = CGPointMake(NewDataX, NewDataY);
                            CGContextAddLines(context, p, 2);
                            CGContextStrokePath(context);
                        }
                        currentPoint[Group] = p[1];
                        _curPos[Group].x = NewDataX;
                        _curPos[Group].y = NewDataY;
                    
            }
    }
    
}
// 绘制网格
- (void)drawEcgGrid:(CGContextRef)context rect:(CGRect)rect
{
    // 线的X轴
    CGFloat line_X = rect.origin.x;
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
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1 green:0.0f blue:0.0f alpha:0.3].CGColor);
    CGContextMoveToPoint(context, smallX, rect.origin.y);
    CGContextAddLineToPoint(context, smallX, rect.origin.y+rect.size.height);
    CGContextStrokePath(context);
}
- (void)DrawSmallGridHorizontalLine:(CGContextRef)context y:(CGFloat)smallY rect:(CGRect)rect
{
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1 green:0.0f blue:0.0f alpha:0.3].CGColor);
    CGContextMoveToPoint(context,rect.origin.x,smallY);
    CGContextAddLineToPoint(context,rect.origin.x+rect.size.width, smallY);
    CGContextStrokePath(context);
}
- (void)DrawBigGridVerticalLine:(CGContextRef)context x:(CGFloat)bigX rect:(CGRect)rect
{
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1 green:0.0f blue:0.0f alpha:0.8].CGColor);
    CGContextMoveToPoint(context, bigX, rect.origin.y);
    CGContextAddLineToPoint(context, bigX, rect.origin.y+rect.size.height);
    CGContextStrokePath(context);
}
- (void)DrawBigGridHorizontalLine:(CGContextRef)context y:(CGFloat)bigY rect:(CGRect)rect
{
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1 green:0.0f blue:0.0f alpha:0.8].CGColor);
    CGContextMoveToPoint(context, rect.origin.x, bigY);
    CGContextAddLineToPoint(context, rect.origin.x+rect.size.width,bigY);
    CGContextStrokePath(context);
}
- (void)drawWave:(NSArray *)data dataLen:(NSInteger)dataLen adunit:(float)adunit
{
    _adunit = adunit;
    _data = data;
    _dataLen = (int)dataLen;
    CGRect dirt2;
   
    int n = _isSingle ? 1 : 12;
    
    
    for (int Group = 0; Group < _showLeadCount; Group++){
        if (ceil(_curPos[Group].x) >= ceil([self getWidth])) {
            _curPos[Group].x = 0;
        }
        CGFloat avg = 0 ;
        for (int dataNum = 0; dataNum < DataCountPerDatas ; dataNum++) {
//            NSLog(@"-----------------_data[%d]:%f::avg:%f",dataNum*n + Group,[_data[dataNum*n + Group] floatValue],avg);
            avg+=  [_data[dataNum*n + Group] floatValue] / adunit;
        }
        _baseLineYMV[Group]=avg/DataCountPerDatas;
//        NSLog(@"-----------------哈哈哈哈哈哈 _adunit:%f---group:%d avg ;: %f,DataCountPerDatas:%d, avg/DataCountPerDatas::%f",_adunit,Group,avg,DataCountPerDatas,avg/DataCountPerDatas);
    }
    dirt2 = CGRectMake(_curPos[0].x, 0, _PerBigGridWidth + RereshShow, [self getHeigth]);
   
    [self setNeedsDisplayInRect:dirt2];
}

- (void)drawWaveWithDataRecord:(DfthEcgRecord *)record adunit:(float)adunit
{
    self.userInteractionEnabled = YES;
    
    NSLog(@"record:::%@  leadOUt:%d",record,record.deviceLeadCount);
    _adunit = adunit;
    _MaxDataNums = 0;
    
    _fileRead = [[DfthEcgFilesReader alloc] initForRecord:record];
    
    _curDataNums = 0;
    
    int n = _isSingle ? 1 : 12;
    _dataLen = DataCountPerSecond*ShowSecond*n;
    [self StartUpdateWaveStartDataNum];
    
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
        [self StartUpdateWaveStartDataNum];
    }
}
- (void)StartUpdateWaveStartDataNum
{
    float avg = 0 ;
    int n = _isSingle ? 1 : 12;
    
    _data = [_fileRead getEcgDataFrom:(int)_curDataNums ofLength:(int)_dataLen];
//    NSLog(@"nnnnnnnnnnn::%d,_curDataNums:%d,_dataLen:%d-- _data.count::%lu",n,_curDataNums,(int)_dataLen,(unsigned long)_data.count);
    
    if (_data.count < _dataLen && _curDataNums != 0) {
        
        if (_data.count == 0) {
            
            return;
            
        }
        
        _curDataNums = (int)(_curDataNums - (_dataLen - _data.count)/n);

       _data = [_fileRead getEcgDataFrom:(int)_curDataNums ofLength:(int)_dataLen];

    }
    _dataLen = (int)_data.count;
    for (int Group = 0; Group < _showLeadCount; Group++) {
        _curPos[Group].x  = 0;
        _baseLineYMV[Group] = 0;
        
        for (int dataNum = 0; dataNum < _dataLen/n; dataNum++) {
            
            avg+= [_data[dataNum*n + Group] floatValue] / _adunit;
            
        }
        _baseLineYMV[Group]=avg/(_dataLen / n);
    }
    [self setNeedsDisplay];
}


@end
