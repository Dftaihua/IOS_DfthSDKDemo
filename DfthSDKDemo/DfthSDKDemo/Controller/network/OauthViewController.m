//
//  OauthViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/27.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "OauthViewController.h"

@interface OauthViewController ()
@property (weak, nonatomic) IBOutlet UITextField *clientId;
@property (weak, nonatomic) IBOutlet UITextField *clientSecret;
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation OauthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _clientId.text = [GlobleData sharedInstance].clientId;
    _clientSecret.text = [GlobleData sharedInstance].clientSecret;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)oauth:(id)sender {
    DfthTask *task = [DfthSDKManager getOauthTaskWithClientId:_clientId.text clientSecret:_clientSecret.text completeHandler:^(DfthResult *result){
        if (result.code == DfthRC_Ok) {
            _logView.text = @"认证成功";
        }else{
            _logView.text = [NSString stringWithFormat:@"认证失败 %@", result.message];
        }
    }];
    
    //    task.timeout = 10;
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
