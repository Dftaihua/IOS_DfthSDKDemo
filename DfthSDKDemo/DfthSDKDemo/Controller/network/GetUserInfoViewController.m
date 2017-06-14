//
//  GetUserInfoViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "GetUserInfoViewController.h"

@interface GetUserInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userId;
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation GetUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userId.text = [GlobleData sharedInstance].userId;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)run:(id)sender {
    DfthTask *task = [DfthSDKManager getUserInfoTaskWith:_userId.text completeHandler:^(DfthResult * _Nonnull result, DfthUser * _Nullable user) {
        if (result.code == DfthRC_Ok) {
            _logView.text = user.description;
            [GlobleData sharedInstance].dfthUser = user;
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
