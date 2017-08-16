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
            
            
            DfthTask *task = [DfthSDKManager accountPassTaskWithUserId:userId oldPass:@"123456" newPass:@"123456" completeHandler:^(DfthResult * _Nonnull result) {
                if (result.code == DfthRC_Ok) {
                    NSLog(@"修改密码成功");
                }
                else
                {
                    NSLog(@"修改密码失败：%@", result.message);
                }
            }];
            [task async];

//            DfthTask *task = [DfthSDKManager getNibpsListWithUser:@"3890f8b95ded498f97a535ea209886c6" pageIndex:1 pageSize:100 startTime:-1 endTime:-1 sort:nil complete:^(DfthResult * _Nonnull result, BOOL isLastPage, NSArray<DfthBpData *> * _Nullable recordArray) {
//                if (result.code == DfthRC_Ok) {
//                    NSLog(@"获取血压列表成功");
//                    for (int i=0; i<recordArray.count; i++) {
//                        NSLog(@"recordArray[i].sbp:%d,recordArray[i].dbp:%d,recordArray[i].pulseRate:%d", recordArray[i].sbp, recordArray[i].dbp, recordArray[i].pulseRate);
//                    }
//                }
//                else
//                {
//                    NSLog(@"获取血压列表失败：%@", result.message);
//                }
//            }];
//            [task async];
            
//            DfthTask *ambpsTask = [DfthSDKManager getAmbpsListWithUser:@"f9fc7c61cb7e486bac68f5a39ff7a273"  pageIndex:0 pageSize:20 startTime:-1 endTime:-1 sort:nil complete:^(DfthResult * _Nonnull result, BOOL isLastPage, NSArray<AmbpsListRecord *> * _Nullable recordArray) {
//                if (result.code == DfthRC_Ok) {
//                    NSLog(@"获取动态血压列表成功");
//                    for (int i=0; i<recordArray.count ; i++) {
//                        NSLog(@"%lld", recordArray[i].createTime);
//                    }
//                }
//                else
//                {
//                    NSLog(@"获取动态血压列表失败：%@", result.message);
//                }
//            }];
//            [ambpsTask async];
            
//            DfthTask *ambpsNibpsTask = [DfthSDKManager getAmbpsNibpsWithUser:@"f9fc7c61cb7e486bac68f5a39ff7a273" planId:@"3d9af63c0d874e60ac04fb1b236a61b2" complete:^(DfthResult * _Nonnull result, NSArray<AmbpsNibpsRecord *> * _Nullable recordArray) {
//                if (result.code == DfthRC_Ok) {
//                    NSLog(@"查询计划中数据成功");
//                    for (int i=0; i<recordArray.count; i++) {
//                        NSLog(@"recordArray[i].systolic:%d,recordArray[i].diastolic:%d,recordArray[i].pulseRate:%d", recordArray[i].systolic, recordArray[i].diastolic, recordArray[i].pulseRate);
//                    }
//                }
//                else
//                {
//                    NSLog(@"查询计划中数据失败：%@", result.message);
//                }
//            }];
//            [ambpsNibpsTask async];
            
            
//            DfthTask *task = [DfthSDKManager getBpDataWithUser:@"f9fc7c61cb7e486bac68f5a39ff7a273" pageIndex:0 pageSize:10 startTime:-1 endTime:-1 sort:nil complete:^(DfthResult * _Nonnull result, BOOL isLastPage, NSArray<DfthBpData *> * _Nullable dataArray) {
//                NSLog(@"result.code:%d,result.message:%@",result.code, result.message);
//                if (result.code == DfthRC_Ok || (result.code == 1 && [result.message isEqualToString:@"网络请求超时"])) {
//                    NSLog(@"查询血压数据成功");
//                }
//                else
//                {
//                    NSLog(@"查询血压数据失败");
//                }
//            }];
//            [task async];
            
//            DfthTask *task = [DfthSDKManager getBpPlanWithUser:@"f9fc7c61cb7e486bac68f5a39ff7a273" pageIndex:0 pageSize:10 startTime:-1 endTime:-1 sort:nil complete:^(DfthResult * _Nonnull result, BOOL isLastPage, NSArray<DfthBpPlan *> * _Nullable dataArray) {
//                if (result.code == DfthRC_Ok) {
//                    NSLog(@"查询血压计划成功");
//                }
//                else
//                {
//                    NSLog(@"%@", result.message);
//                }
//            }];
//            [task async];
            
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
