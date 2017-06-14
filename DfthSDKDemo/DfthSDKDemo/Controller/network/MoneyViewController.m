//
//  MoneyViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/5/5.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "MoneyViewController.h"

@interface MoneyViewController ()
@property (weak, nonatomic) IBOutlet UITextView *log;
@property (nonatomic, strong) NSArray<DfthPackage *> *package;
@property (nonatomic, copy) NSString *orderNo;
@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getFreePackages:(id)sender {
    _log.text = @"";
    
    DfthTask *task = [DfthSDKManager getFreePackagesForUser:[GlobleData sharedInstance].userId complete:^(DfthResult * _Nonnull result, NSArray<DfthPackage *> * _Nullable packages) {
        if (result.code == DfthRC_Ok) {
            for (DfthPackage *r in packages) {
                _log.text = [_log.text stringByAppendingFormat:@"%@", r.description];
            }
            _package = packages;
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)order:(id)sender {
    DfthTask *task = [DfthSDKManager orderPackages:_package forUser:[GlobleData sharedInstance].userId complete:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"订购成功";
        }else{
            _log.text = result.message;
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
