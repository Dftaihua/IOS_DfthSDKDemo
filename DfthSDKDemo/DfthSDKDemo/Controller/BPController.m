//
//  BPController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BPController.h"
#import "AppDelegate.h"

@interface BPController ()
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (strong, nonatomic) DfthBpDevice *device;
@property(nonatomic, strong) NSString *userId;

@end

@implementation BPController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userId = [GlobleData sharedInstance].userId;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getDevice:(id)sender {
    DfthTask *task = [DfthSDKManager getDevice:nil ofType:DDT_BP completeHandler:^(DfthResult * _Nonnull result, __kindof DfthDevice * _Nullable device) {
        if (result.code == DfthRC_Ok) {
            _device = device;
            [GlobleData sharedInstance].device = device;
            [_device setUserId:_userId];
            _logView.text = [NSString stringWithFormat:@"当前设备：%@", _device.mac];
        }else{
            _logView.text = @"发现设备失败";
        }
    }];
    [task async];
}
- (IBAction)showDeviceVersion:(id)sender {
    DfthTask *task = [_device getDeviceVersionTaskWithCompleteHandler:^(DfthResult * _Nonnull result, NSString * _Nonnull version) {
        if (result.code == DfthRC_Ok) {
            _logView.text = [NSString stringWithFormat:@"设备版本：%@",[_device version]];
        }else{
            _logView.text = [NSString stringWithFormat:@"查询设备版本错误"];
        }
    }];
    [task async];
}
- (IBAction)connect:(id)sender {
    DfthTask *task = [_device getConnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _logView.text = @"连接设备成功";
            [_device appendStateDelegate:self];
            _device.delegate = self;
        }else{
            _logView.text = @"连接设备失败";
        }
    }];
//    task.timeout = 5;
    [task async];
}
- (IBAction)disconnect:(id)sender {
    if (_device) {
        DfthTask *task = [_device getDisconnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"连接已断开";
                [_device removeStateDelegate:self];
                _device.delegate = nil;
            }else{
                _logView.text = @"断开连接失败";
            }
        }];
        [task async];
    }
}
- (IBAction)startMeasure:(id)sender {
    if (_device) {
        DfthTask *task = [_device getStartMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result, NSTimeInterval startTime) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"开始测量成功";
            }else{
                _logView.text = @"开始测量失败";
            }
        }];
        task.timeout = 5;
        [task async];
    }
}
- (IBAction)startTrialMeasure:(id)sender {
    if (_device) {
        DfthTask *task = [_device getStartTrialMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result, NSTimeInterval startTime) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"开始测量成功";
            }else{
                _logView.text = @"开始测量失败";
            }
        }];
        task.timeout = 5;
        [task async];
    }
}
- (IBAction)stopMeasure:(id)sender {
    if (_device) {
        DfthTask *task = [_device getStopMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"停止测量成功";
            }else{
                _logView.text = @"停止测量失败";
            }
        }];
        [task async];
    }
}
- (IBAction)requestUserPlan:(id)sender {
    _logView.text = [NSString stringWithFormat:@"用户计划：%@", [_device.userPlan description]];
}
- (IBAction)requestDevicePlan:(id)sender {
    if (_device) {
        DfthTask *task = [_device getQueryDevicePlanTaskWithCompleteHanlder:^(DfthResult *result, DfthBpPlan *plan) {
            if (result.code == DfthRC_Ok) {
                NSString *str = [NSString stringWithFormat:@"设备计划：%@", [plan description]];
                _logView.text = str;
            }else{
                _logView.text = @"查询设备计划失败";
            }
        }];
        [task async];
    }
}
- (IBAction)requestDeviceState:(id)sender {
    if (_device) {
        DfthTask *task = [_device getQueryDeviceStatusTaskWithCompleteHanlder:^(DfthResult * _Nonnull result, DfthBpDeviceState * _Nullable state) {
            if (result.code == DfthRC_Ok) {
                NSString *str = [NSString stringWithFormat:@"设备状态：%@", [state description]];
                _logView.text = str;
            }else{
                _logView.text = @"查询设备状态失败";
            }
        }];
        [task async];
    }
}
- (IBAction)setAPlan:(id)sender {
    if (_device) {
        int dayInterval = 30;
        int nightInterval = 60;
        DfthTask *task = [_device getMakePlanTaskWithDayInterval:dayInterval nightInterval:nightInterval alarmTime:30 completeHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"设置计划成功";
            }else{
                _logView.text = @"设置计划失败";
            }
        }];
        [task async];
    }
}
- (IBAction)clearDevicePlan:(id)sender {
    if (_device) {
        DfthTask *task = [_device getClearPlanTaskWithCompleteHanlder:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"清除计划成功";
            }else{
                _logView.text = @"清除计划失败";
            }
        }];
        [task async];
    }
}
- (IBAction)openVoice:(id)sender {
    if (_device) {
        DfthTask *task = [_device getOpenVoiceTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"打开语音成功";
            }else{
                _logView.text = @"打开语音失败";
            }
        }];
        [task async];
    }
}
- (IBAction)closeVoice:(id)sender {
    if (_device) {
        DfthTask *task = [_device getCloseVoiceTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"关闭语音成功";
            }else{
                _logView.text = @"关闭语音失败";
            }
        }];
        [task async];
    }
}
- (IBAction)requestVoiceState:(id)sender {
    if (_device) {
        DfthTask *task = [_device getQueryVoiceStatusTaskWithCompleteHandler:^(DfthResult *result, BpVoiceState state) {
            if (result.code == DfthRC_Ok) {
                _logView.text = [NSString stringWithFormat:@"语音状态查询成功 %lld (0位开启，1为关闭)", (int64_t)state];
            }else{
                _logView.text = @"语音状态查询失败";
            }
        }];
        [task async];
    }
}
- (IBAction)queryPlanResult:(id)sender {
    NSArray<DfthBpData *> *result = [DfthSDKManager getUser:_userId bpDatasOfMeasureMode:BPMM_Plan whichMeasuredBetween:0 and:[[NSDate date] timeIntervalSince1970]];
    
    NSString *str = [[NSString alloc] init];
    for (DfthBpData *data in result) {
        str = [str stringByAppendingString:[data description]];
    }
    
    _logView.text = str;
}
- (IBAction)queryManualResult:(id)sender {
    NSArray<DfthBpData *> *result = [DfthSDKManager getUser:_userId bpDatasOfMeasureMode:BPMM_Manual whichMeasuredBetween:0 and:[[NSDate date] timeIntervalSince1970]];
    
    NSString *str = [[NSString alloc] init];
    for (DfthBpData *data in result) {
        str = [str stringByAppendingString:[data description]];
    }
    _logView.text = str;
}

- (void)handleCurrentPressure:(int)pressure
{
    _logView.text = [NSString stringWithFormat:@"测量压力值：%d mmHg",(int)(pressure/12.6)];
}

- (void)bpMeasureResult:(DfthBpData *)results
{
    _logView.text = [NSString stringWithFormat:@"测量结果：高压:%d 低压:%d 心率:%d", results.sbp, results.dbp, results.pulseRate];
}

- (void)bpMeasureFailed{
    _logView.text = @"测量失败";
}

- (void)connectState:(BOOL)isConnected measureState:(BOOL)isMeasuring{
    _logView.text = [NSString stringWithFormat:@"状态: connected=%d measuring=%d", isConnected, isMeasuring];
    NSLog(@"状态: connected=%d measuring=%d", isConnected, isMeasuring);
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
