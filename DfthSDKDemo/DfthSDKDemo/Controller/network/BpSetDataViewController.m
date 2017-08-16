//
//  BpSetDataViewController.m
//  DfthSDKDemo
//
//  Created by liuyanmei on 17/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#define KSCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define KSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#import "BpSetDataViewController.h"
#import "PlanTableViewCell.h"

@interface BpSetDataViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    short *planTime;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger createTime;
@property (nonatomic, strong) DfthBpPlan *plan;

@property (nonatomic, strong) NSMutableArray <NSMutableArray *> *allDatas;
@property (nonatomic, strong) NSMutableArray <NSString *> *alltimeDatas;

@end

@implementation BpSetDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _allDatas = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 41;i++) {
        
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
        [_allDatas addObject:arr];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectBeginTime:(id)sender {
    UIDatePicker *datePicker = [[ UIDatePicker alloc]init];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    if (date) {
        [datePicker setDate:date];
    }
    datePicker.datePickerMode=UIDatePickerModeDateAndTime;
    [datePicker setMinimumDate:[NSDate dateWithTimeIntervalSinceNow:0]];
    NSString *title=@"\n\n\n\n\n\n\n\n\n\n\n\n";
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        formatter.dateFormat = @"YYYY.MM.dd hh:mm:ss";
        NSString *timestamp = [formatter stringFromDate:datePicker.date];
        _createTime = [self timeSwitchTimestamp:timestamp andFormatter:@"YYYY.MM.dd hh:mm:ss"];
        [sender setTitle:timestamp forState:UIControlStateNormal];
        
    }];
    [alertController.view addSubview:datePicker];
    [alertController addAction:confirm];
    [alertController addAction:cancel];
    
    UIPopoverPresentationController *alertPopoverPresentationController = alertController.popoverPresentationController;
    UIButton *imagePickerButton = (UIButton*)sender;
    alertPopoverPresentationController.sourceRect = imagePickerButton.frame;
    alertPopoverPresentationController.sourceView = self.view;
    
    [self presentViewController:alertController animated:YES completion:nil];

}
- (IBAction)makaPlan:(id)sender {
#ifdef DEBUG
    _plan = [DfthSDKManager makeBpPlanByDayInterval:30 nigthInterval:60 alarm:60];
    
    planTime = [_plan getSchedules];
    
    if (_alltimeDatas == nil) {
        _alltimeDatas = [[NSMutableArray alloc] init];
        
    }
    [_alltimeDatas removeAllObjects];
    
    for (int i = 0; i < 41; i++)
    {
       [_alltimeDatas addObject:[self timestampSwitchTime:(planTime[i]*60 + _createTime) andFormatter:@"YYYY.MM.dd hh:mm:ss"]];
    }
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 200, KSCREEN_WIDTH-20, 360)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellStyleDefault;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
#else

#endif
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"PlanCell";
    PlanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[PlanTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.row = indexPath.row;
    
    cell.datasArr = _allDatas[indexPath.row];
    [cell setObject:_alltimeDatas[indexPath.row]];
    
    NSMutableArray *arr = cell.datasArr;
    
    cell.updateDataBlock = ^()
    {
        [_allDatas replaceObjectAtIndex:indexPath.row withObject:arr];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


//点击空白处隐藏键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self judge_view:self.view];
}

-(void)judge_view:(UIView*)view
{
    NSArray *views = view.subviews;
    if(views == nil || views.count == 0 || [view isKindOfClass:[UITextField class]]
       || [view isKindOfClass:[UITextView class]])
    {
        if([view isKindOfClass:[UITextField class]]
           || [view isKindOfClass:[UITextView class]])
        {
            [view resignFirstResponder];
        }
        
        return;
    }
    for(UIView *v in views)
    {
        [self judge_view:v];
    }
    
}

-(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY.MM.dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    return timeSp;
    
}

-(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY.MM.dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
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
