//
//  LoginViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    DfthTask *task = [DfthSDKManager getLoginTaskWithAccount:_account.text password:_password.text completeHandler:^(DfthResult * _Nonnull result, NSString * _Nonnull userId) {
        if (result.code == DfthRC_Ok) {
            _logView.text = [NSString stringWithFormat:@"登录成功: userId = %@", userId];
            [GlobleData sharedInstance].userId = userId;
            [GlobleData sharedInstance].dfthUser = [DfthSDKManager getUser:userId];
        }
        else{
            _logView.text = [NSString stringWithFormat:@"登录失败: %@", result.message];
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
