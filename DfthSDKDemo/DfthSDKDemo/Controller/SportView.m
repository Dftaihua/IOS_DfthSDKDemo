//
//  SportView.m
//  ThreeInOne
//
//  Created by admin on 2017/3/21.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "SportView.h"
//#import <DfthSDK/DatFileReader.h>

//#define DataCountPerSecond  250.0 // 心仪设备每秒传过来的数据个数

#define MAXHeart 300
#define DataCountPerSecond  250 // 心仪设备每秒传过来的数据个数

#define KSCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define KSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface SportView()
{
    DfthEcgFilesReader *_fileRead; // NSArray<Sport *> *
    NSArray<Sport *> *_sportArr;
    
    
    CGFloat _perSportWidth;
    
    NSMutableArray *_datArr;
    CGFloat _baseLineY;
    CGFloat _baseLineYHeart;
    CGFloat _perDatX;
    CGFloat _perDatY;
    
    CGFloat _MaxHeart;
    CGFloat _heightPerYHeart;
    
    UIImageView *_imageView;
    UIImageView *_gpsView;
    
    NSMutableArray *_datPointYs;
 
}
@end

@implementation SportView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self setBaseLine];
        
        [self setImageView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    int startIndex = -1;// 初始化的值
//    NSInteger startSortState = -1; // 初始化的值
    CGFloat lineWith = 0;

    
    for (int i = 0; i < _sportArr.count; i++) {
        
        Sport *sport = _sportArr[i];
        
        if (i < _sportArr.count - 1) {
            
            Sport *nextSport = _sportArr[i + 1];
            lineWith = _perSportWidth * (nextSport.index - sport.index);
            
            if (sport.state == 100) {
                
                [self drawLine:context withColor:[self colorWithHexString:@"#f8b62c"] originX:(sport.index * _perSportWidth) rect:rect lineWidth:lineWith];
                
            }else if (sport.state == 200) {
                
                [self drawLine:context withColor:[self colorWithHexString:@"#ff7d27"] originX:(sport.index * _perSportWidth) rect:rect lineWidth:lineWith];
            }
            
            
        }else
        {
            lineWith = KSCREEN_WIDTH - sport.index*_perSportWidth;
            if (sport.state == 100) {
                
                [self drawLine:context withColor:[self colorWithHexString:@"#f8b62c"] originX:(sport.index * _perSportWidth) rect:rect lineWidth:lineWith];
                
            }else if (sport.state == 200) {
                
                [self drawLine:context withColor:[self colorWithHexString:@"#ff7d27"] originX:(sport.index * _perSportWidth) rect:rect lineWidth:lineWith];
            }
        }
    }
     
    [self draPath:context rect:rect];
}

- (void)draPath:(CGContextRef)context rect:(CGRect)rect
{
    
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);

    CGContextMoveToPoint(context, 0, [self getHeigth] - 1);
    
    CGFloat startPoint_X = 0;
    
    
    for (int i = 0; i < _datArr.count; i ++) {
        
        ECGStorageResult *result = _datArr[i];
       
        
        CGFloat Point_Y = [self getHeigth] - 1 - (_perDatY * result.HeartRate);
        
        CGFloat Point_X = _perDatX * result.R_peak;
        
        if (Point_X >= [self getWidth]) {
            
            Point_X = [self getWidth];
            
        }
        [_datPointYs addObject:[NSNumber numberWithFloat:Point_Y]];
        if (Point_X - startPoint_X >= 1.0) {
            
            CGContextAddLineToPoint(context, Point_X, Point_Y);
            
            startPoint_X = Point_X;
            
        }
    
        
        if (i == (_datArr.count - 1) && Point_X < [self getWidth]) {
               
                Point_Y = [self getHeigth] - 1;
                CGContextAddLineToPoint(context, Point_X, Point_Y);
                
                Point_X = [self getWidth];
                CGContextAddLineToPoint(context, Point_X, Point_Y);
            
        }
        
    }
   
    CGContextStrokePath(context);
    
}
- (void)drawLine:(CGContextRef)context withColor:(UIColor *)color originX:(CGFloat)originX rect:(CGRect)rect lineWidth:(CGFloat)lineWidth
{
     CGContextSetFillColorWithColor(context, color.CGColor);
    CGRect addrect = CGRectMake(originX, 0, lineWidth, rect.origin.y + rect.size.height);
    CGContextAddRect(context, addrect);
    CGContextFillPath(context);
}
- (void)setEcgFilesReader:(DfthEcgFilesReader *)fileRead
{
//    _ecgRecord = ecgRecord;
//    _fileRead = [[DfthEcgFilesReader alloc] initForRecord:ecgRecord];
    _fileRead = fileRead;
    
    _sportArr = [_fileRead getAllSportState];
    
//    for (Sport *sports in _sportArr) {
//    
//        NSLog(@"sportArr.count:%ld sports.index:%d state:%d",_sportArr.count,sports.index,sports.state);
//        
//    }
    
    
    CGFloat seconds = [_fileRead getEcgDataLength] / DataCountPerSecond ;
    CGFloat width = seconds * SportCountPerSecond;
//    CGFloat width = _sportArr.count;
    if (seconds > 3) {
        
        width -= 30;
    }
    _perSportWidth = [self getWidth] / width;
    
    [self setConfig];
    
    
    
    [self setNeedsDisplay];
   
}
- (void)setConfig
{
    if (_datPointYs == nil) {
        
        _datPointYs = [[NSMutableArray alloc] init];
    }
    [_datPointYs removeAllObjects];
    
    
    
    _baseLineY = [self getHeigth] /  2;
    _MaxHeart = 1;
    _baseLineYHeart = 0;
    
//    _fileRead = [[DfthEcgFilesReader alloc] initForRecord:_ecgRecord];
    
//    [_fileRead getAllSportState];
//    NSArray *datArr;
//    int index = 0;
    
    if (_datArr == nil) {
        _datArr = [[NSMutableArray alloc] init];
    }
    [_datArr removeAllObjects];

 
//   NSArray<ECGStorageResult*> * ResultsArr = [_fileRead getDatDataFrom:0 ofLength:(int)[_fileRead getEcgDataLength]];
    

    
    [_datArr addObjectsFromArray:[_fileRead getDatDataFrom:0 ofLength:(int)[_fileRead getEcgDataLength]]];
    
    for (ECGStorageResult *result in _datArr) {
        
        _baseLineYHeart += result.HeartRate;
        if (_MaxHeart < result.HeartRate) {
            _MaxHeart = result.HeartRate;
        }
    }
    
    _baseLineYHeart = _baseLineYHeart / _datArr.count;
//
    _heightPerYHeart = ([self getHeigth] - _baseLineY) / (_MaxHeart - _baseLineYHeart);
//
    _perDatY = [self getHeigth] / MAXHeart;
    
//    CGFloat _perDatWidth = [self getWidth] / ([_fileRead getEcgDataLength] - 750);
//

   
    
     _perDatX = [self getWidth] / ([_fileRead getEcgDataLength] - 750);
    
   
//    for (ECGStorageResult *result in _datArr) {
//        
//         NSLog(@"_perDatX::%f dataCount:%lu result.peak:%d",_perDatX,(unsigned long)_datArr.count,result.R_peak);
//    }
    
    
}
- (void)setImageView
{
   
//    _imageView.image = [UIImage imageNamed:@"main_result_heart_gps"];
    
   
    
     UIImage *image = [UIImage imageNamed:@"main_result_heart_gps"];
//    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake([_gpsView getHeigth]/2-4, [_gpsView getHeigth],8, 8)];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(image.size.height/2-4, [self getHeigth] - 8,8, 8)];
    _imageView.backgroundColor = [UIColor redColor];
    _imageView.layer.cornerRadius = 4;
    [self addSubview:_imageView];
    
   
    //    _gpsView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.height, image.size.height)];
    _gpsView = [[UIImageView alloc] initWithFrame:CGRectMake(0, [self getHeigth] - 8 - image.size.height, image.size.height, image.size.height)];
    //    _gpsView.backgroundColor = [UIColor yellowColor];
    _gpsView.image = image;
    [self addSubview:_gpsView];
}
- (int)setPathDatValue:(CGFloat)value
{
 
    
    
    
    CGPoint rect = _imageView.center;
    int minIndex = 0;
    for (int i = 0; i < _datArr.count; i++) {
    

 
        ECGStorageResult *result = _datArr[i];
         CGFloat X =  result.R_peak;
        if (X >= value) {
            
            minIndex = i;
            break;
            
        }else
        {
            minIndex = i;
        }
    }

    
    if (_datPointYs.count > minIndex) {
        
        NSNumber *num = [_datPointYs objectAtIndex:minIndex];
        
        ECGStorageResult *result = _datArr[minIndex];
        
 
        rect.x = _perDatX * result.R_peak;
 
        rect.y = [num floatValue];
        
        if (rect.x >= [self getWidth]) {
            rect.x = [self getWidth];
        }
        
        ECGStorageResult *lastResult;
        if (minIndex > 0) {
            
            lastResult = _datArr[minIndex - 1];
        }
        
        
        if ((result.R_peak < value) && minIndex == _datPointYs.count - 1) {
            
            rect.x = _perDatX * value;
            rect.y = [self getHeigth] - 1;
            
        }
        else if(((result.R_peak > value) && minIndex == 0) || (minIndex > 0 && (lastResult.HeartRate == 0) && (result.HeartRate == 0)))
        {
            rect.x = _perDatX * value;
            rect.y = [self getHeigth] - 1;
        }
        
        if (rect.y <= 0) {
            
            CGRect frame = _gpsView.frame;
            frame.origin.y = 0;
            _gpsView.frame = frame;
            
            CGRect imageFrame = _imageView.frame;
            imageFrame.origin.y = _gpsView.frame.size.height;
            _imageView.frame = imageFrame;
            
        }else
        {
           _imageView.center = rect;
            rect.y -= _gpsView.frame.size.width/2+_imageView.frame.size.height;
            _gpsView.center = rect;
        }

    }
    
    
    
    CGFloat seconds = value / DataCountPerSecond ;
    CGFloat valueSportIndex = seconds * SportCountPerSecond;
    //    CGFloat width = _sportArr.count;
    
//    NSLog(@"startSport.valueSportIndex:%f value:%F",valueSportIndex,value);
    
    // 通过value判断运动状态
    
    for (int i = 0; i < _sportArr.count; i++) {
        
        Sport *startSport = _sportArr[i];
        
        if (i < _sportArr.count - 1) {
            
            Sport *endSport = _sportArr[i+1];
            
            if ((valueSportIndex >= startSport.index) && ((valueSportIndex < endSport.index))) {
                
                return startSport.state;
                
            }
            
            
        }else
        {
            return startSport.state;
            

        }
    }
    return 0;
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

- (CGFloat)getHeigth
{
    return self.frame.size.height;
}
- (CGFloat)getWidth
{
    return self.frame.size.width;
}


@end
