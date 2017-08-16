//
//  UpdateUserInfoViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "UpdateUserInfoViewController.h"

@interface UpdateUserInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *userTel;
@property (weak, nonatomic) IBOutlet UITextField *birthday;
@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *blood;
@property (weak, nonatomic) IBOutlet UITextField *nation;
@property (weak, nonatomic) IBOutlet UITextField *zone;
@property (weak, nonatomic) IBOutlet UITextField *kindredName;
@property (weak, nonatomic) IBOutlet UITextField *kindredNumber;
@property (weak, nonatomic) IBOutlet UITextView *logView;

@end

@implementation UpdateUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI{
    if ([GlobleData sharedInstance].dfthUser == nil) {
        return;
    }
    
    _userName.text = [GlobleData sharedInstance].dfthUser.name;
    _gender.text = [NSString stringWithFormat:@"%d", [GlobleData sharedInstance].dfthUser.gender];
    _userTel.text = [GlobleData sharedInstance].dfthUser.telNumber;
    _birthday.text = [NSString stringWithFormat:@"%ld", (long)[GlobleData sharedInstance].dfthUser.birthday];
    _height.text = [NSString stringWithFormat:@"%d", [GlobleData sharedInstance].dfthUser.height];
    _weight.text = [NSString stringWithFormat:@"%d", [GlobleData sharedInstance].dfthUser.weight];
    _nation.text = [GlobleData sharedInstance].dfthUser.nation;
    
    _zone.text = [GlobleData sharedInstance].dfthUser.timeZone;
    _kindredName.text = [GlobleData sharedInstance].dfthUser.kindredName;
    _kindredNumber.text = [GlobleData sharedInstance].dfthUser.kindredNumber;
    _logView.text = @"初始化成功";
    
}

- (void)loadUserInfoFromUI{
    DfthUser *user = [GlobleData sharedInstance].dfthUser;
    user.name = _userName.text;
    user.gender = [_gender.text intValue];
    user.telNumber = _userTel.text;
    user.birthday = [_birthday.text intValue];
    user.height = [_height.text intValue];
    user.weight = [_weight.text intValue];
    user.nation = _nation.text;
    user.timeZone = _zone.text;
    user.kindredName = _kindredName.text;
    user.kindredNumber = _kindredNumber.text;
}

- (IBAction)run:(id)sender {
    if ([GlobleData sharedInstance].dfthUser == nil) {
        return;
    }
    
    [self loadUserInfoFromUI];
    
    DfthTask *task = [DfthSDKManager getUpdateMemberInfoTaskWithUser:[GlobleData sharedInstance].dfthUser completeHandler:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _logView.text = @"更新成功";
        }else{
            _logView.text = @"更新失败";
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
