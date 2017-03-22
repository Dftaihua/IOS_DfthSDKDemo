//
//  BpViewController.m
//  BlueToothDemo
//
//  Created by yue gao on 2017/3/20.
//  Copyright © 2017年 com.dfth.BlueToothDemo. All rights reserved.
//

#import "BpViewController.h"
#import "AppDelegate.h"


@interface BpViewController () <DfthDeviceStateDelegate, DfthBpDeviceDelegate>
{
    DfthBpDevice *_device;
    UILabel *_deviceLabel;
    UILabel *_text;
    UITextView *_historyView;
    int day_plan_time;
    int night_plan_time;
    
}
@property(nonatomic, strong) NSString *userId;

@end

@implementation BpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"血压";
    day_plan_time = 30;
    night_plan_time = 30;
    
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
    NSArray *array1 = @[@"连接", @"断开连接"];
    [self buildButtons:array1 nums:2 top:(top)];
    
    top += kBUTTONHEIGHT + kSpace;
    NSArray *array2 = @[@"开始测量",@"停止测量"];
    [self buildButtons:array2 nums:2 top:(top)];
 
    top += kBUTTONHEIGHT+kSpace;
    NSArray *array3 = @[@"用户计划", @"设备计划",@"设备状态"];
    [self buildButtons:array3 nums:3 top:(top)];
    
    top += kBUTTONHEIGHT + kSpace;
    NSArray *array4 = @[@"下发计划", @"清除计划"];
    [self buildButtons:array4 nums:2 top:(top)];
    
    top += kBUTTONHEIGHT+kSpace;
    NSArray *array5 = @[@"打开语音",@"关闭语音",@"语言状态"];
    [self buildButtons:array5 nums:3 top:(top)];
    
    top += kBUTTONHEIGHT+kSpace;
    NSArray *array7 = @[@"自动测量结果",@"手动测量结果"];
    [self buildButtons:array7 nums:2 top:(top)];

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
    if ([title isEqualToString:@"扫描设备"]) {
        [self scanBPDevices];
    }else if([title isEqualToString:@"版本信息"])
    {
        [self queryBPVersion];
    }else if ([title isEqualToString:@"连接"])
    {
        [self connectDevice];
    }else if ([title isEqualToString:@"断开连接"])
    {
        [self disconnect];
    }else if ([title isEqualToString:@"开始测量"])
    {
        [self startMeasure];
    }else if ([title isEqualToString:@"停止测量"])
    {
        [self stopMeasure];
    }
    else if([title isEqualToString:@"设备计划"])
    {
        [self queryDevicePlanState];
    }else if([title isEqualToString:@"用户计划"])
    {
        NSString *str = [NSString stringWithFormat:@"用户计划：%@", [_device userPlan]];
        _historyView.text = str;
    }else if ([title isEqualToString:@"设备状态"])
    {
        [self queryDeviceState];
    }else if ([title isEqualToString:@"下发计划"])
    {
        [self setBpPlan];
    }else if ([title isEqualToString:@"清除计划"])
    {
        [self clearPlan];
    }else if ([title isEqualToString:@"打开语音"])
    {
        [self openVoice];
    }else if ([title isEqualToString:@"关闭语音"])
    {
        [self closeVoice];
    }else if ([title isEqualToString:@"语言状态"])
    {
        [self queryVoiceState];
    }else if ([title isEqualToString:@"自动测量结果"])
    {
        [self requestPlanResult];
    }else if ([title isEqualToString:@"手动测量结果"])
    {
        [self requestManualResult];
    }
}

- (void)scanBPDevices
{
    DfthTask *task = [DfthSDKManager getBpDevice:nil completeHandler:^(DfthResult * _Nonnull result, DfthBpDevice * _Nonnull device) {
        if (result.code == DfthRC_Ok) {
            _historyView.text = @"发现设备成功";
            _device = device;
            [_device setUserId:_userId];
            _deviceLabel.text = [NSString stringWithFormat:@"当前设备：%@", _device.mac];
        }else{
            _historyView.text = @"发现设备失败";
        }
    }];
    [task async];
}

- (void)connectDevice
{
    DfthTask *task = [_device getConnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _historyView.text = @"连接设备成功";
            [_device appendStateDelegate:self];
            _device.delegate = self;
        }else{
            _historyView.text = @"连接设备失败";
        }
    }];
    task.timeout = 5;
    [task async];
}

- (void)disconnect{
    if (_device) {
        DfthTask *task = [_device getDisconnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"连接已断开";
                [_device removeStateDelegate:self];
                _device.delegate = nil;
            }else{
                _historyView.text = @"断开连接失败";
            }
        }];
        [task async];
    }
}

- (void)startMeasure{
    if (_device) {
        DfthTask *task = [_device getStartMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"开始测量成功";
            }else{
                _historyView.text = @"开始测量失败";
            }
        }];
        [task async];
    }
}

- (void)stopMeasure{
    if (_device) {
        DfthTask *task = [_device getStopMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"停止测量成功";
            }else{
                _historyView.text = @"停止测量失败";
            }
        }];
        [task async];
    }
}

- (void)queryVoiceState{
    if (_device) {
        DfthTask *task = [_device getQueryVoiceStatusTaskWithCompleteHandler:^(DfthResult *result, BpVoiceState state) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = [NSString stringWithFormat:@"语音状态查询成功 %ld (0位开启，1为关闭)", (long)state];
            }else{
                _historyView.text = @"语音状态查询失败";
            }
        }];
        [task async];
    }
}

- (void)openVoice{
    if (_device) {
        DfthTask *task = [_device getOpenVoiceTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"打开语音成功";
            }else{
                _historyView.text = @"打开语音失败";
            }
        }];
        [task async];
    }
}

- (void)closeVoice{
    if (_device) {
        DfthTask *task = [_device getCloseVoiceTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"关闭语音成功";
            }else{
                _historyView.text = @"关闭语音失败";
            }
        }];
        [task async];
    }
}

- (void)queryDeviceState{
    if (_device) {
        DfthTask *task = [_device getQueryDeviceStatusTaskWithCompleteHanlder:^(DfthResult * _Nonnull result, DfthBpDeviceState * _Nullable state) {
            if (result.code == DfthRC_Ok) {
                NSString *str = [NSString stringWithFormat:@"设备状态：%@", [state description]];
                _historyView.text = str;
            }else{
                _historyView.text = @"查询设备状态失败";
            }
        }];
        [task async];
    }
}

- (void)queryDevicePlanState{
    if (_device) {
        DfthTask *task = [_device getQueryDevicePlanTaskWithCompleteHanlder:^(DfthResult *result, DfthBpPlan *plan) {
            if (result.code == DfthRC_Ok) {
                NSString *str = [NSString stringWithFormat:@"设备计划：%@", [plan description]];
                _historyView.text = str;
            }else{
                _historyView.text = @"查询设备计划失败";
            }
        }];
        [task async];
    }
}

- (void)setBpPlan{
    NSLog(@"%d, %d", day_plan_time, night_plan_time);
    //    if (day_plan_time == 16*60 && day_plan_time == 8*60) {
    //        NSLog(@"下发计划失败，不能白天和晚上都无计划");
    //    }
    
    if (_device) {
        DfthTask *task = [_device getMakePlanTaskWithDayInterval:day_plan_time nightInterval:day_plan_time alarmTime:30 completeHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"设置计划成功";
            }else{
                _historyView.text = @"设置计划失败";
            }
        }];
        [task async];
    }
}

- (void)clearPlan{
    if (_device) {
        DfthTask *task = [_device getClearPlanTaskWithCompleteHanlder:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _historyView.text = @"清除计划成功";
            }else{
                _historyView.text = @"清除计划失败";
            }
        }];
        [task async];
    }
}

- (void)queryBPVersion
{
    _text.text = [NSString stringWithFormat:@"设备版本：%@",[_device version]];
}

- (void)requestPlanResult{
    NSArray<DfthBpData *> *result = [DfthSDKManager getUser:_userId bpDatasOfMeasureMode:BPMM_Plan whichMeasuredBetween:0 and:[[NSDate date] timeIntervalSince1970]];
    
    NSString *str = [[NSString alloc] init];
    for (DfthBpData *data in result) {
        str = [str stringByAppendingString:[data description]];
    }
    
    _historyView.text = str;
}

- (void)requestManualResult{
    NSArray<DfthBpData *> *result = [DfthSDKManager getUser:_userId bpDatasOfMeasureMode:BPMM_Manual whichMeasuredBetween:0 and:[[NSDate date] timeIntervalSince1970]];

    NSString *str = [[NSString alloc] init];
    for (DfthBpData *data in result) {
        str = [str stringByAppendingString:[data description]];
    }
    _historyView.text = str;
}


- (void)handleCurrentPressure:(int)pressure
{
    _text.text = [NSString stringWithFormat:@"测量压力值：%d mmHg",(int)(pressure/12.6)];
}

- (void)bpMeasureResult:(DfthBpData *)results
{
    _text.text = [NSString stringWithFormat:@"测量结果：高压:%d 低压:%d 心率:%d", results.sbp, results.dbp, results.pulseRate];
}



- (void)bpPlanMeasureFailed{
    _text.text = @"测量失败";
}


- (void)viewWillDisappear:(BOOL)animated
{
    [_device removeStateDelegate:self];
    [super viewWillDisappear:animated];
}


- (void)stateChangeFrom:(NSString *)previousState to:(NSString *)currentState{
    NSLog(@"device state change from %@ to %@", previousState, currentState);
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
