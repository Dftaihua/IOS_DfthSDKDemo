//
//  BPDataController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BPDataController.h"

@interface BPDataController ()
@property (weak, nonatomic) IBOutlet UITextField *SBP;
@property (weak, nonatomic) IBOutlet UITextField *DBP;
@property (weak, nonatomic) IBOutlet UITextField *pulseRate;
@property (weak, nonatomic) IBOutlet UITextView *log;

@end

@implementation BPDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)parse:(id)sender {
#if DEBUG
    DfthBpData *data = [DfthSDKManager parseBpDataBySbp:[_SBP.text intValue] dbp:[_DBP.text intValue] pulseRate:[_pulseRate.text intValue]];
    
    _log.text = data.description;
#else
    _log.text = @"非debug模式不支持此操作";
#endif
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
