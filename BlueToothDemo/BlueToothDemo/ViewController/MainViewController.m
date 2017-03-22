//
//  ViewController.m
//  DfthDemo
//
//  Created by admin on 2016/11/18.
//  Copyright © 2016年 admintest. All rights reserved.
//

#import "MainViewController.h"
#import "SingleEcgViewController.h"
#import "TwelveEcgViewController.h"
#import "BpViewController.h"
#import "AppDelegate.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"第三方授权认证", @"单导心电",@"12导心电",@"血压"];
    
    for (int i = 0; i < array.count; i ++) {
        UIButton *btn = [UIButton createBtnWithName:array[i] hightLight:YES supView:self.view frame:kCGWidthCenterRectMake(100+80*i, 60, 200)];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
            [self oauth];
            break;
        }
        case 1:
        {
            SingleEcgViewController *ecgViewController = [[SingleEcgViewController alloc] init];
            [self.navigationController pushViewController:ecgViewController animated:NO];
            break;
        }
        case 2:
        {
            TwelveEcgViewController *twelveEcgViewController = [[TwelveEcgViewController alloc] init];
            [self.navigationController pushViewController:twelveEcgViewController animated:NO];
            break;
        }
        case 3:
        {
            BpViewController *bpViewController = [[BpViewController alloc] init];
            [self.navigationController pushViewController:bpViewController animated:NO];
            break;
        }
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)oauth{
    DfthTask *task = [DfthSDKManager getOauthTaskWithClientId:@"6113bc97353c4ee5a50c90686b381fa0" clientSecret:@"7de8c68d06a84e1699eb223d134f95e3" completeHandler:^(DfthResult *result){
        if (result.code == DfthRC_Ok) {
            NSLog(@"认证成功");
            [self createUser];
        }else{
            NSLog(@"认证失败");
        }
    }];
    
//    task.timeout = 10;
    [task async];
}

- (void)createUser
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy/MM/dd";
    NSDate *birthday = [df dateFromString:@"2010/01/01"];
    
    int gender = 1; //1：男，2：女
    DfthTask *task = [DfthSDKManager getRegisterTaskWithUserName:@"DebugUser" gender:gender birthday:[birthday timeIntervalSince1970] mobile:@"13888888888" completeHandler:^(DfthResult * _Nonnull result, NSString * _Nonnull userId) {
        if (result.code == DfthRC_Ok) {
            NSLog(@"注册成功: %@", userId);
            AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            app.userId = userId;;
        }else{
            NSLog(@"注册失败");
        }
    }];
    
//    task.timeout = 10;
    [task async];
}


@end
