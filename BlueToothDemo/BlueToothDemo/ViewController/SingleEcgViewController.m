//
//  SingleEcgViewController.m
//  BlueToothDemo
//
//  Created by yue gao on 2017/3/20.
//  Copyright © 2017年 com.dfth.BlueToothDemo. All rights reserved.
//

#import "SingleEcgViewController.h"
#import "AppDelegate.h"
#import "WaveView.h"


@interface SingleEcgViewController (){
    DfthSingleEcgDevice *_ecgDevice;
    DfthTask *_getDeviceTask;
    DfthTask *_connectTask;
    UILabel *_deviceLabel;
    UILabel *_text;
    UITextView *_historyView;
    WaveView *_waveView;
}
@property(nonatomic, strong) NSString *userId;
@end

@implementation SingleEcgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"单导心电";
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.userId = app.userId;
    [self ConfigUI];
}

- (void)ConfigUI
{
    int top = 80;
    
    NSArray *array = @[@"扫描设备", @"版本信息"];
    [self buildButtons:array nums:2 top:(top)];
    
    top += kBUTTONHEIGHT + kSpace;
    _deviceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, top, self.view.frame.size.width-40, kBUTTONHEIGHT)];
    [self.view addSubview:_deviceLabel];
    
    top += kBUTTONHEIGHT + kSpace;
    _text = [[UILabel alloc] initWithFrame:CGRectMake(20, top, self.view.frame.size.width-40, kBUTTONHEIGHT)];
    [self.view addSubview:_text];
    
    top += kBUTTONHEIGHT + kSpace;
    _waveView = [[WaveView alloc] initWithFrame:CGRectMake(20, top, self.view.frame.size.width-40, 150)];
    [_waveView setBackgroundColor:[UIColor whiteColor]];
    [self.view insertSubview:_waveView atIndex:0];
    [_waveView setShowLeadCount:1];
    [_waveView setIsSingle:true];
    
    top += 150 + kSpace;
    NSArray *array1 = @[@"连接", @"断开连接"];
    [self buildButtons:array1 nums:2 top:(top)];
    
    top += kBUTTONHEIGHT + kSpace;
    NSArray *array2 = @[@"开始测量",@"停止测量"];
    [self buildButtons:array2 nums:2 top:(top)];
    
    top += kBUTTONHEIGHT + kSpace;
    NSArray *array3 = @[@"查询历史数据"];
    [self buildButtons:array3 nums:1 top:(top)];
    
    top += kBUTTONHEIGHT + kSpace;
    _historyView = [[UITextView alloc] initWithFrame:CGRectMake(20, top, self.view.frame.size.width-40, 100)];
    [self.view addSubview:_historyView];
}

- (void)buildButtons:(NSArray *)array nums:(int)num top:(int)top
{
    for (int i = 0; i < num; i ++) {
        UIButton *btn = [UIButton createBtnWithName:array[i] hightLight:YES supView:self.view frame:kCGNUMSWidthCenterRectMake(top,kBUTTONHEIGHT,num,i)];
        [btn addTarget:self action:@selector(buttonCLick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)buttonCLick:(UIButton *)btn
{
    
    NSString *title = btn.titleLabel.text;
    if ([title isEqualToString:@"扫描设备"])
    {
        [self scanECGDevices];
    }else if([title isEqualToString:@"版本信息"])
    {
        [self queryECGVersion];
    }else if ([title isEqualToString:@"连接"])
    {
        [self connectDevice];
    }else if ([title isEqualToString:@"开始测量"])
    {
        [self startMeasure];
    }else if ([title isEqualToString:@"停止测量"])
    {
        [self stopMeasure];
    }else if ([title isEqualToString:@"断开连接"])
    {
        [self disconnect];
    }else if ([title isEqualToString:@"查询历史数据"])
    {
        NSArray<DfthEcgRecord *> *list =  [DfthSDKManager getUser:self.userId ecgRecordsAtPage:0 whichContains:10];
//        NSLog(@"心电历史数据--%@--",mEcgDataList);
        NSString *str = [[NSString alloc] init];
        for (int i = 0; i < list.count; i++) {
            str = [str stringByAppendingString:[list[i] description]];
        }
        [_historyView setText:str];
    }
}

- (void)scanECGDevices
{
    if (_getDeviceTask == nil) {
        _getDeviceTask = [DfthSDKManager getSingleEcgDevice:nil completeHandler:^(DfthResult *result, DfthSingleEcgDevice * _Nonnull device) {
            NSLog(@"获取设备结束 %d", result.code);
            if (device != nil) {
                _ecgDevice = device;
                [_ecgDevice setUserId:_userId];
                [_ecgDevice setDataDelegate:self];
                [_ecgDevice appendStateDelegate:self];
                
                _deviceLabel.text = [NSString stringWithFormat:@"当前设备: %@", _ecgDevice.mac];
            }
            _getDeviceTask = nil;
        }];
        _getDeviceTask.timeout = 20;
        [_getDeviceTask async];
    }else{
        [_getDeviceTask cancel];
        _getDeviceTask = nil;
    }
}
- (void)connectDevice
{
    if (_connectTask == nil) {
        _connectTask = [_ecgDevice getConnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                NSLog(@"连接设备成功");
            }else{
                NSLog(@"连接设备失败");
            }
            _text.text = [NSString stringWithFormat:@"设备版本：%@",[_ecgDevice version]];
            _connectTask = nil;
        }];
        _connectTask.timeout = 20;
        [_connectTask async];
    }else{
        [_connectTask cancel];
        _connectTask = nil;
    }
    
}

- (void)disconnect{
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getDisconnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                NSLog(@"连接已断开");
            }else{
                NSLog(@"断开连接失败");
            }
        }];
        [task async];
    }
}

- (void)startMeasure{
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getStartMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                NSLog(@"开始测量成功");
            }else{
                NSLog(@"开始测量失败");
            }
        }];
        [task async];
    }
}

- (void)stopMeasure{
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getStopMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                NSLog(@"停止测量成功");
            }else{
                NSLog(@"停止测量失败");
            }
        }];
        [task async];
    }
}

- (void)queryECGVersion
{
    _text.text = [NSString stringWithFormat:@"设备版本：%@",[_ecgDevice version]];
}

- (void)handleEcgData:(NSArray *)data leadOutFlag:(int)leadOutFlag heartRate:(int)heartRate isEmptyData:(BOOL)isEmpty
{
    _text.text = [NSString stringWithFormat:@"测量数据：%d, 当前心率:%d",[data[0] shortValue], heartRate];
    //    NSLog(@"RECEIVE DATA data[0] = %d, lenth = %lu", [data[0] shortValue], (unsigned long)data.count);

    [_waveView drawWave:data dataLen:data.count adunit:_ecgDevice.ADUnit];
}

- (void)handleMeasureResult:(DfthEcgRecord *)ecgRecord{
    NSLog(@"result = %@", ecgRecord);
}


- (void)stateChangeFrom:(NSString *)previousState to:(NSString *)currentState{
    NSLog(@"device state change from %@ to %@", previousState, currentState);
}

- (void)viewDidDisappear:(BOOL)animated{
    [_ecgDevice removeStateDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
