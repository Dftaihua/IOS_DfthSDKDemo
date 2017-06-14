//
//  PlanTableViewCell.m
//  DfthSDKDemo
//
//  Created by liuyanmei on 17/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "PlanTableViewCell.h"

@interface PlanTableViewCell()<UITextFieldDelegate>
{
    UITextField *_sbp;
    UITextField *_dbp;
    UITextField *_pulse;
    
}
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation PlanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createCell];
    }
    return self;
}

- (void)createCell
{
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 150, 40)];
    _timeLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_timeLabel];
    
    
    _sbp = [[UITextField alloc] initWithFrame:CGRectMake(155, 5, 40, 30)];
    _sbp.layer.borderWidth = 1;
    _sbp.layer.borderColor = [UIColor blackColor].CGColor;
    _sbp.tag = 0;
    _sbp.delegate = self;
    [self addSubview:_sbp];
    
    
    _dbp = [[UITextField alloc] initWithFrame:CGRectMake(205, 5, 40, 30)];
    _dbp.layer.borderWidth = 1;
    _dbp.layer.borderColor = [UIColor blackColor].CGColor;
    _dbp.tag = 1;
    _dbp.delegate = self;
    [self addSubview:_dbp];
    
    
    _pulse = [[UITextField alloc] initWithFrame:CGRectMake(255, 5, 40, 30)];
    _pulse.layer.borderWidth = 1;
    _pulse.layer.borderColor = [UIColor blackColor].CGColor;
    _pulse.tag = 2;
    _pulse.delegate = self;
    [self addSubview:_pulse];
}

-(void)setObject:(NSString*)obj
{
    _timeLabel.text = obj;
}
- (void)setDatasArr:(NSMutableArray<NSString *> *)datasArr
{
    _datasArr = datasArr;
    _sbp.text = datasArr[0];
    _dbp.text = datasArr[1];
    _pulse.text = datasArr[2];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_datasArr replaceObjectAtIndex:textField.tag withObject:textField.text];
    if (self.updateDataBlock) {
        self.updateDataBlock();
    }
}

@end
