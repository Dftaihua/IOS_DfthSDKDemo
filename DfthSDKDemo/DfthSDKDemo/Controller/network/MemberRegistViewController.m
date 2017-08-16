//
//  MemberRegistViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/4/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "MemberRegistViewController.h"

@interface MemberRegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *verifyCode;
@property (weak, nonatomic) IBOutlet UITextView *log;

@end

@implementation MemberRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)verifyCode:(id)sender {
    DfthTask *task = [DfthSDKManager getRequestVerifyCodeTaskWithTelNumber:_mobile.text completeHandler:^(DfthResult * _Nonnull result) {
        _log.text = result.description;
    }];
    [task async];
}

- (IBAction)regist:(id)sender {
    DfthTask *task = [DfthSDKManager getRegisterTaskWithAccount:_mobile.text password:_password.text verifyCode:_verifyCode.text completeHandler:^(DfthResult * _Nonnull result, DfthUser * _Nonnull user) {
        _log.text = result.description;
        if (user != nil) {
            _log.text = [_log.text stringByAppendingString:user.description];
            [GlobleData sharedInstance].userId = user.userId;
            [GlobleData sharedInstance].dfthUser = user;
        }
    }];
    [task async];
}
- (IBAction)loginWithVerifyCode:(id)sender {
    DfthTask *task = [DfthSDKManager getLoginTaskWithTelNumber:_mobile.text verifyCode:_verifyCode.text completeHandler:^(DfthResult * _Nonnull result, NSString * _Nonnull userId) {
        _log.text = result.description;
        if (userId != nil) {
            _log.text = [_log.text stringByAppendingString:userId];
            [GlobleData sharedInstance].userId = userId;
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
