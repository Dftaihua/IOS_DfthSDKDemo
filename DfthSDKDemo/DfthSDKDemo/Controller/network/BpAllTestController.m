//
//  BpAllTestController.m
//  DfthSDKDemo
//
//  Created by gaoyue on 2017/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BpAllTestController.h"
#import "BpDataCell.h"
#import "GlobleData.h"

@interface BpAllTestController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DfthBpPlan *plan;
@property (strong, nonatomic) NSMutableArray<DfthBpData*> *datas;
@property (weak, nonatomic) IBOutlet UILabel *log;
@end

@implementation BpAllTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _datas = [[NSMutableArray alloc] init];
    
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createPlan:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:_timePicker.date];
    NSLog(@"TIME = %@, %lld", strDate, (int64_t)[_timePicker.date timeIntervalSince1970]);
    
    
    NSLog(@"%@", _timePicker.date);
    _plan = [[DfthBpPlan alloc] initWithDayInterval:30 nightInterval:60 alarmTime:120 appId:[GlobleData sharedInstance].clientId userId:[GlobleData sharedInstance].userId deviceMac:[GlobleData sharedInstance].device.mac createTime:_timePicker.date];
    
    NSLog(@"plan=%@", _plan);
    
    [_datas removeAllObjects];
    short *schedules = [_plan getSchedules];
    for (int i = 0; i < _plan.totalCount; i++) {
        DfthBpData *data = [[DfthBpData alloc] initWith:[GlobleData sharedInstance].userId deviceMac:[GlobleData sharedInstance].device.mac measureMode:BPMM_Plan index:i measureTime:(_plan.planCreateTime + schedules[i]*60) sbp:120 dbp:60 pulseRate:80 appId:[GlobleData sharedInstance].clientId];
        [_datas addObject:data];
    }
    
    [_tableView reloadData];
}

- (IBAction)saveToDB:(id)sender {
#if 0
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i = 0; i < _plan.totalCount; i++) {
        BpDataCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathWithIndex:i]];
        [temp addObject:[cell get]];
    }
    [_datas removeAllObjects];
#endif
#ifdef DEBUG
    [DfthSDKManager insertBpDatas:_datas];
    [DfthSDKManager insertBpPlan:_plan];
    _log.text = @"写入成功";
#else
    _log.text = @"非debug模式不支持此操作";
#endif
} 

- (IBAction)uploadBpDatas:(id)sender {
    DfthTask *task = [DfthSDKManager uploadAllBpDataForUser:[GlobleData sharedInstance].userId complete:^(DfthResult * _Nonnull result, NSArray<DfthBpData *> * _Nullable datas) {
        NSLog(@"result=%@", result.description);
        if (result.code == DfthRC_Ok) {
            _log.text = @"上传数据成功";
//            [_plan makePlanFinish];
        }else{
            _log.text = [NSString stringWithFormat:@"失败：%@", result.description];
        }
    }];
    
    [task async];
}

- (IBAction)uploadBpPlan:(id)sender {
#if 0
    DfthTask *task = [DfthSDKManager uploadBpPlan:_plan complete:^(DfthResult * _Nonnull result, DfthBpPlan * _Nullable plan) {
        NSLog(@"result=%@", result.description);
        if (result.code == DfthRC_Ok) {
            NSString *stander = plan.standard==0?@"未达标":@"达标";
            NSString *pattern;
            switch (plan.pattern) {
                case 1:
                    pattern = @"杓型";
                    break;
                case 2:
                    pattern = @"反杓型";
                    break;
                case 3:
                    pattern = @"非杓型";
                    break;
                case 4:
                    pattern = @"深杓型";
                    break;
                default:
                    break;
            }
            _log.text = [NSString stringWithFormat:@"成功，%@，%@", stander, pattern];
        }else{
            _log.text = [NSString stringWithFormat:@"失败：%@", result.message];
        }
    }];
    
    [task async];
#endif
    DfthTask *task = [DfthSDKManager uploadAllBpPlanForUser:[GlobleData sharedInstance].userId complete:^(DfthResult * _Nonnull result, NSArray<DfthBpPlan *> * _Nullable plans) {
    }];
    [task async];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"BpDataCellIdentifier";
    
    BpDataCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             identifier];
    if (cell == nil) {
        cell = [[BpDataCell alloc] init];
    }
    
    NSUInteger row = [indexPath row];
    [cell displayWithData:_datas[row]];
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)getTimeString:(int64_t)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *date_fotmatter = [[NSDateFormatter alloc] init];
    [date_fotmatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [date_fotmatter stringFromDate:date];
}

@end
