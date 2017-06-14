//
//  DiseaseViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/5/9.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "DiseaseViewController.h"

@interface DiseaseViewController ()
@property (weak, nonatomic) IBOutlet UITextView *log;
@property (copy, nonatomic) NSString *userId;
@property (copy, nonatomic) NSArray *nameArray;

@end

@implementation DiseaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userId = [GlobleData sharedInstance].userId;
    _nameArray = [[NSArray alloc] initWithObjects:@"", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getDiseaseDictionary:(id)sender {
    DfthTask *task = [DfthSDKManager getDiseaseDictionaryWithComplete:^(DfthResult * _Nonnull result, NSArray<Disease *> * _Nullable diseases) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"获取疾病字典成功\n";
            _nameArray = diseases;
            for (Disease *d in diseases) {
                _log.text = [_log.text stringByAppendingString:d.description];
            }
        }
        else
        {
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)getUserDiseases:(id)sender {
    DfthTask *task = [DfthSDKManager getUserDiseaseListWith:_userId complete:^(DfthResult * _Nonnull result, NSArray<Disease *> * _Nullable diseases) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"获取病史成功\n";
            for (Disease *d in diseases) {
                _log.text = [_log.text stringByAppendingString:d.description];
            }
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)createUserDiseases:(id)sender {
    DfthTask *task = [DfthSDKManager diseaseCreateForUser:_userId diseases:_nameArray complete:^(DfthResult * _Nonnull result){
        if (result.code == DfthRC_Ok) {
            _log.text = @"创建病史成功";
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)updateUserDisease:(id)sender {
    DfthTask *task = [DfthSDKManager diseaseUpdateForUser:_userId diseases:_nameArray complete:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"更新病史成功";
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)getHabitDictionary:(id)sender {
    DfthTask *task = [DfthSDKManager getHabitDictionaryWithComplete:^(DfthResult * _Nonnull result, NSArray<Habit *> * _Nullable habits) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"获取生活习惯字典成功\n";
            for (Habit *h in habits) {
                _log.text = [_log.text stringByAppendingString:h.description];
            }
            _nameArray = habits;
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)getUserHabits:(id)sender {    DfthTask *task = [DfthSDKManager getUserHabitListWith:_userId complete:^(DfthResult * _Nonnull result, NSArray<Habit *> * _Nullable habits) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"获取生活习惯字典成功\n";
            for (Habit *h in habits) {
                _log.text = [_log.text stringByAppendingString:h.description];
            }
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)createUserHabits:(id)sender {
    DfthTask *task = [DfthSDKManager habitCreateWith:_userId habits:_nameArray complete:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"创建生活习惯成功";
        }else{
            _log.text = result.message;
        }
    }];
    [task async];
}

- (IBAction)updateUserHabit:(id)sender {
    DfthTask *task = [DfthSDKManager habitUpdateWith:_userId habits:_nameArray complete:^(DfthResult * _Nonnull result) {
        if (result.code == DfthRC_Ok) {
            _log.text = @"更新生活习惯成功";
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
