//
//  BpPlanViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/28.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BpPlanViewController.h"

@interface BpPlanViewController ()
@property (weak, nonatomic) IBOutlet UITextView *log;
@property (weak, nonatomic) IBOutlet UITextField *page;
@property (weak, nonatomic) IBOutlet UITextField *count;
@property (weak, nonatomic) IBOutlet UITextField *recordIndex;
@property () NSArray<DfthBpPlan *> *plans;

@end

@implementation BpPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)queryPlan:(id)sender {
    _plans = [DfthSDKManager getUser:[GlobleData sharedInstance].userId bpPlansAtPage:[_page.text intValue] whichContains:[_count.text intValue]];
    _log.text = @"";
    for (int i = 0; i < _plans.count; i++) {
        _log.text = [_log.text stringByAppendingFormat:@"序号：%d\n", i];
        _log.text = [_log.text stringByAppendingFormat:@"%@\n", [_plans[i] jsonString]];
    }
}
- (IBAction)uploadPlan:(id)sender {
    DfthTask *task = [DfthSDKManager uploadAllBpPlanForUser:[GlobleData sharedInstance].userId complete:^(DfthResult * _Nonnull result, NSArray<DfthBpPlan *> * _Nullable plans) {
        if (result.code == DfthRC_Ok) {
            _log.text = [NSString stringWithFormat:@"上传成功:\n%@", plans];
        }else{
            _log.text = [NSString stringWithFormat:@"上传失败:\n%@", plans];
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
