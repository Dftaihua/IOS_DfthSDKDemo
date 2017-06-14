//
//  BPPlanController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BPPlanController.h"

@interface BPPlanController ()
@property (weak, nonatomic) IBOutlet UITextField *day;
@property (weak, nonatomic) IBOutlet UITextField *nigth;
@property (weak, nonatomic) IBOutlet UITextField *alarm;
@property (weak, nonatomic) IBOutlet UITextView *log;

@end

@implementation BPPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)makePlan:(id)sender {
#ifdef DEBUG
    DfthBpPlan *plan = [DfthSDKManager makeBpPlanByDayInterval:[_day.text intValue] nigthInterval:[_nigth.text intValue] alarm:[_alarm.text intValue]];
    
    _log.text = plan.description;
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
