//
//  ResetPasswordViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/4/3.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *verifyCode;
@property (weak, nonatomic) IBOutlet UITextView *log;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getVerifyCode:(id)sender {
    DfthTask *task = [DfthSDKManager getResetPasswordVerifyCodeTaskWithTelNumber:_mobile.text completeHandler:^(DfthResult * _Nonnull result) {
        _log.text = result.description;
    }];
    
    [task async];
}
- (IBAction)reset:(id)sender {
    DfthTask *task = [DfthSDKManager getResetPasswordTaskWithTelNumber:_mobile.text password:_password.text verifyCode:_verifyCode.text completeHandler:^(DfthResult * _Nonnull result) {
        _log.text = result.description;
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
