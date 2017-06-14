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
    _deviceMac.text = [GlobleData sharedInstance].device.mac;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)DeviceList:(id)sender {
    
        DfthTask *task = [DfthSDKManager getDeviceListTaskWith:@"A0:E6:F8:4E:40:C6" completeHandler:^(DfthResult * _Nonnull result, NSMutableArray<Response_DeviceList *> * _Nullable deviceInfo) {
    
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
    
         DfthTask *task = [DfthSDKManager getDeviceInfoTaskWith:@"A0:E6:F8:4E:40:C6" completeHandler:^(DfthResult * _Nonnull result, Response_DeviceInfo * _Nullable deviceInfo) {
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
    
    DfthTask *task =  [DfthSDKManager getDeviceBindTaskWith:_userId.text macAddr:@"A0:E6:F8:4E:40:C6" bindTime:@"2017-9-10" useTime:0 useAddrProvince:@"" useAddrCity:@"" completeHandler:^(DfthResult * _Nonnull result, Response_DeviceBinding * _Nullable deviceInfo) {
        if (result.code == DfthRC_Ok) {
            
            NSLog(@"绑定成功");
            _logView.text = deviceInfo.description;
        } else {
            _logView.text = result.message;
        }
        
    }];
    [task async];

    
//    DfthTask *bind = [DfthSDKManager bindDevice:_deviceMac.text forUser:_userId.text complete:^(DfthResult * _Nonnull result) {
//        if (result.code == DfthRC_Ok) {
//            _logView.text = @"绑定成功";
//        }else{
//            _logView.text = @"绑定失败";
//        }
//    }];
//    [bind async];
    
    /////////////////////////  周素华 Add  start／／／／／／／／／／／／／／／／／／
    
    //    DfthTask *task = [DfthSDKManager getfriendsListTaskWith:_userId.text completeHandler:^(DfthResult * _Nonnull result, Response_FriendsList * _Nullable friendsList) {
    //
    //        if (result.code == DfthRC_Ok) {
    //            _logView.text = friendsList.description;
    //        } else {
    //            _logView.text = result.message;
    //        }
    //
    //    }];
    //    [task async];
    
    
    
    
    
   
    
    
    /////////////////////////  周素华 Add  end／／／／／／／／／／／／／／／／／／
    //
    

}
- (IBAction)unbind:(id)sender {
//    DfthTask *bind = [DfthSDKManager unbindDevice:_deviceMac.text forUser:_userId.text complete:^(DfthResult * _Nonnull result) {
//        if (result.code == DfthRC_Ok) {
//            _logView.text = @"解绑成功";
//        }else{
//            _logView.text = @"解绑失败";
//        }
//    }];
//    [bind async];
    
        DfthTask *task =  [DfthSDKManager getDeviceUnBindTaskWith:_userId.text mac:@"A0:E6:F8:4E:40:C6" completeHandler:^(DfthResult * _Nonnull result, Response_DeviceUnBind * _Nullable deviceInfo) {
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
