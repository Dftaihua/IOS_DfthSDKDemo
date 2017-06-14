//
//  ViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "SingleEcgController.h"
#import "WaveView.h"
#import "AppDelegate.h"
#import <DfthUtilities/DfthUtilities.h>

@interface SingleEcgController ()
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) DfthTask *getDeviceTask;
@property (strong, nonatomic) DfthTask *connectTask;
@property (strong, nonatomic) DfthSingleEcgDevice *ecgDevice;
@property (weak, nonatomic) IBOutlet WaveView *waveView;
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation SingleEcgController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
//    self.userId = app.userId;
    _userId = [GlobleData sharedInstance].userId;
    
    [_waveView setShowLeadCount:1];
    [_waveView setIsSingle:true];
    
}

- (void)test{
    NSString *path = [NSString stringWithFormat:@"%@/Documents/test.txt", NSHomeDirectory()];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isexit = [fm fileExistsAtPath:path];
    if (!isexit) {
        NSLog(@"文件不存在！");
    }else{
//        [fm removeItemAtPath:path error:nil];
//        [fm createFileAtPath:path contents:nil attributes:nil];
        NSLog(@"文件存在");
    }
    [fm createFileAtPath:path contents:nil attributes:nil];
    //
    NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
    char buffer[] = {1,2,3,4,5,6};
    NSMutableData *data = [[NSMutableData alloc] initWithBytes:buffer length:sizeof(buffer)];
    [handle seekToEndOfFile];
    [handle writeData:data];
//    [handle synchronizeFile];
    [handle closeFile];
    
    unsigned long long size = [self fileSize:path];
    NSLog(@"path= %@", path);
    NSLog(@"size = %lld", size);
    
    NSString *md5 = [FileMD5Utils getFileMD5WithPath:path];
    NSLog(@"md5 = %@", md5);
    
}

- (unsigned long long)fileSize:(NSString *)path
{
    // 总大小
    unsigned long long size = 0;
//    NSString *sizeText = nil;
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    BOOL exist = [manager fileExistsAtPath:path isDirectory:&isDir];
    
    // 判断路径是否存在
    if (!exist) return size;
    if (isDir) { // 是文件夹
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:path];
        for (NSString *subPath in enumerator) {
            NSString *fullPath = [path stringByAppendingPathComponent:subPath];
            size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
            
        }
    }else{ // 是文件
        size += [manager attributesOfItemAtPath:path error:nil].fileSize;
    }
    return size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getDevice:(id)sender {
    if (_getDeviceTask == nil) {
        //@"A0:E6:F8:4E:40:D6"
        _getDeviceTask = [DfthSDKManager getDevice:nil ofType:DDT_SingleEcg completeHandler:^(DfthResult * _Nonnull result, __kindof DfthDevice * _Nullable device) {
            NSLog(@"获取设备结束 %d", result.code);
            if (device != nil) {
                _ecgDevice = device;
                [GlobleData sharedInstance].device = device;
                [_ecgDevice setUserId:_userId];
                [_ecgDevice setDataDelegate:self];
                [_ecgDevice appendStateDelegate:self];
                
                _logView.text = [NSString stringWithFormat:@"当前设备: %@", _ecgDevice.mac];
            }else{
                _logView.text = @"获取设备失败";
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

- (IBAction)showDeviceVersion:(id)sender {
#if 0
    [self test];
#else
    
    DfthTask *task = [_ecgDevice getDeviceVersionTaskWithCompleteHandler:^(DfthResult * _Nonnull result, NSString * _Nonnull version) {
        if (result.code == DfthRC_Ok) {
            _logView.text = [NSString stringWithFormat:@"设备版本：%@",[_ecgDevice version]];
        }else{
            _logView.text = [NSString stringWithFormat:@"查询设备版本错误"];
        }
    }];
    [task async];
#endif
}

- (IBAction)connect:(id)sender {
    if (_connectTask == nil) {
        _connectTask = [_ecgDevice getConnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                NSLog(@"连接设备成功");
            }else{
                NSLog(@"连接设备失败");
            }
            _connectTask = nil;
        }];
        _connectTask.timeout = 20;
        [_connectTask async];
    }else{
        [_connectTask cancel];
        _connectTask = nil;
    }
}

- (IBAction)disconnect:(id)sender {
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getDisconnectTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"连接已断开";
            }else{
                _logView.text = @"断开连接失败";
            }
        }];
        [task async];
    }
}

- (IBAction)startMeasure:(id)sender {
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getStartMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"开始测量成功";
            }else{
                _logView.text = @"开始测量失败";
            }
        }];
        [task async];
    }
}

- (IBAction)startPlanMeasure:(id)sender {
    if (_ecgDevice) {
        //单位秒
        DfthTask *task = [_ecgDevice getStartMeasureTaskWithMeasureLength:24*60*60 CompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"开始24小时定时测量成功";
            }else{
                _logView.text = @"开始24小时定时测量失败";
            }
        }];
        [task async];
    }
}
- (IBAction)startTrialMeasure:(id)sender {
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getStartTrialMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"开始体验测量成功";
            }else{
                _logView.text = @"开始体验测量失败";
            }
        }];
        [task async];
    }
}

- (IBAction)stopMeasure:(id)sender {
    if (_ecgDevice) {
        DfthTask *task = [_ecgDevice getStopMeasureTaskWithCompleteHandler:^(DfthResult * _Nonnull result) {
            if (result.code == DfthRC_Ok) {
                _logView.text = @"停止测量成功";
            }else{
                _logView.text = @"停止测量失败";
            }
        }];
        [task async];
    }
}

- (IBAction)getMeasureRecord:(id)sender {
#if 0
    NSArray<DfthEcgRecord *> *list =  [DfthSDKManager getUser:self.userId ecgRecordsAtPage:0 whichContains:10];
    NSString *str = [[NSString alloc] init];
    for (int i = 0; i < list.count; i++) {
        str = [str stringByAppendingString:[list[i] description]];
    }
    _logView.text = str;
#else
    DfthTask *task = [DfthSDKManager getUser:self.userId pageIndex:1 pageSize:10 startTime:-1 endTime:-1 leadCount:1 sort:nil complete:^(DfthResult * _Nonnull result, BOOL isLastPage, NSArray<DfthEcgRecord *> * _Nullable recordArray) {
        if (result.code == DfthRC_Ok) {
            NSString *str = [[NSString alloc] init];
            for (int i = 0; i < recordArray.count; i++) {
                str = [str stringByAppendingString:[recordArray[i] description]];
            }
            _logView.text = str;
        }else{
            _logView.text = result.message;
        }
    }];
    [task async];
#endif
}

- (void)handleEcgData:(NSArray *)data leadOutFlag:(int)leadOutFlag heartRate:(int)heartRate isEmptyData:(BOOL)isEmpty
{
    _logView.text = [NSString stringWithFormat:@"测量数据：%d, 当前心率:%d, 导联脱落:%d",[data[0] shortValue], heartRate, leadOutFlag];
    //    NSLog(@"RECEIVE DATA data[0] = %d, lenth = %lu", [data[0] shortValue], (unsigned long)data.count);
    
    [_waveView drawWave:data dataLen:data.count adunit:_ecgDevice.ADUnit];
}

- (void)handleMeasureResult:(DfthEcgRecord *)ecgRecord{
    NSLog(@"测量状态: 测量结果");

    _logView.text = [ecgRecord description];
}

- (void)onMeasureStopped{
    NSLog(@"测量状态: 测量结束");
}
//- (void)stateChangeFrom:(NSString *)previousState to:(NSString *)currentState{
//    _logView.text = [NSString stringWithFormat:@"状态改变: %@ -> %@",  previousState, currentState];
//    NSLog(@"状态改变: %@ -> %@",  previousState, currentState);
//}

- (void)connectState:(BOOL)isConnected measureState:(BOOL)isMeasuring{
    _logView.text = [NSString stringWithFormat:@"状态: connected=%d measuring=%d", isConnected, isMeasuring];
    NSLog(@"状态: connected=%d measuring=%d", isConnected, isMeasuring);
}

@end
