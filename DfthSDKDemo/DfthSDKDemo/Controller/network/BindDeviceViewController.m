//
//  BindDeviceViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/24.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BindDeviceViewController.h"

@interface BindDeviceViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userId;
@property (weak, nonatomic) IBOutlet UITextField *deviceMac;
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation BindDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userId.text = [GlobleData sharedInstance].userId;
//    _deviceMac.text = @"A0:E6:F8:4E:40:C6";
     _deviceMac.text = @"00:15:83:E7:5D:95";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
}
- (void)tapClick
{
    
    if ([_userId isFirstResponder]) {
        [_userId resignFirstResponder];
    }
    
    if ([_deviceMac isFirstResponder]) {
        [_deviceMac resignFirstResponder];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)UserDeviceList:(id)sender {
    
    DfthTask *task = [DfthSDKManager getUserDevicelistTaskWith:_userId.text completeHandler:^(DfthResult * _Nonnull result, NSMutableArray<Response_UserDeviceList *> * _Nullable deviceInfo) {
        
        if (result.code == DfthRC_Ok) {
            
//            NSLog(@" 获取用户绑定的设备信息成功----%@- ",deviceInfo);
            NSMutableString *str = [[NSMutableString alloc] init];
            for (Response_UserDeviceList *device in deviceInfo) {
                [str appendString:@"bindTime:"];
                [str appendString:[NSString stringWithFormat:@"%ld",device.bindTime]];
                [str appendString:@"\ndevType:"];
                if (device.devType == nil) {
                    [str appendString:@""];
                }else
                {
                  [str appendString:device.devType];
                }
                [str appendString:@"\nmacAddr:"];
                [str appendString:device.macAddr];
                [str appendString:@"\ndevVersion:"];
                if (device.devVersion == nil) {
                    [str appendString:@""];
                }else
                {
                    [str appendString:device.devVersion];
                }
//                [str appendString:device.devVersion];
                [str appendString:@"\n\n"];
                
            }
            _logView.text = str;
        } else {
            _logView.text = result.message;
        }
        
    }];
     [task async];
}

- (IBAction)DeviceList:(id)sender {
    
        DfthTask *task = [DfthSDKManager getDeviceListTaskWith:_deviceMac.text completeHandler:^(DfthResult * _Nonnull result, NSMutableArray<Response_DeviceList *> * _Nullable deviceInfo) {
    
            if (result.code == DfthRC_Ok) {
                NSMutableString *str = [[NSMutableString alloc] init];
                for (Response_DeviceList *deviceList in deviceInfo) {
                    [str appendString:deviceList.description];
                    [str appendString:@"\n\n"];
                }
                _logView.text = str;
            } else {
                _logView.text = result.message;
            }
    
        }];
        [task async];
}
- (IBAction)DeviceInfo:(id)sender {
    
    
    
         DfthTask *task = [DfthSDKManager getDeviceInfoTaskWith:_deviceMac.text completeHandler:^(DfthResult * _Nonnull result, Response_DeviceInfo * _Nullable deviceInfo) {
                    if (result.code == DfthRC_Ok) {
    
                        NSLog(@" 设备信息获取成功----%@--%@---%@ ",deviceInfo.macAddr,deviceInfo.name,deviceInfo);
                        _logView.text = deviceInfo.description;
                    } else {
                        _logView.text = result.message;
                    }
    
                }];
    
        [task async];
}

- (IBAction)bind:(id)sender {
    
    DfthTask *task =  [DfthSDKManager getDeviceBindTaskWith:_userId.text devType:@"TKBPH01" devVersion:@"V2.1.3" macAddr:_deviceMac.text bindTime:@"2017-9-10" useTime:0 useAddrProvince:@"" useAddrCity:@"" completeHandler:^(DfthResult * _Nonnull result, Response_DeviceBinding * _Nullable deviceInfo) {
        if (result.code == DfthRC_Ok) {
            
            NSLog(@"绑定成功");
            _logView.text = deviceInfo.description;
        } else {
            _logView.text = result.message;
        }
        
    }];
    [task async];
}
- (IBAction)unbind:(id)sender {
    
        DfthTask *task =  [DfthSDKManager getDeviceUnBindTaskWith:_userId.text mac:_deviceMac.text completeHandler:^(DfthResult * _Nonnull result, Response_DeviceUnBind * _Nullable deviceInfo) {
                   if (result.code == DfthRC_Ok) {
                       _logView.text = deviceInfo.description;
                   } else {
                       _logView.text = result.message;
                   }
    
    
               }];
        [task async];

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
