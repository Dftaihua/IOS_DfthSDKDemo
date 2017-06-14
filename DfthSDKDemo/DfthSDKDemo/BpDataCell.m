//
//  BpDataCell.m
//  DfthSDKDemo
//
//  Created by gaoyue on 2017/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "BpDataCell.h"

@implementation BpDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_sbp setDelegate:self];
    [_dbp setDelegate:self];
    [_pulseRate setDelegate:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)displayWithData:(DfthBpData *)bpData
{
    _data = bpData;
    _title.text = [NSString stringWithFormat:@"%-2d.  %@", bpData.index + 1, [self getTimeString:bpData.measureTime]];
    _sbp.text = [NSString stringWithFormat:@"%d", bpData.sbp];
    _dbp.text = [NSString stringWithFormat:@"%d", bpData.dbp];
    _pulseRate.text = [NSString stringWithFormat:@"%d", bpData.pulseRate];

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [_sbp setDelegate:self];
        [_dbp setDelegate:self];
        [_pulseRate setDelegate:self];
    }
    return self;
}


- (NSString *)getTimeString:(int64_t)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *date_fotmatter = [[NSDateFormatter alloc] init];
    [date_fotmatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [date_fotmatter stringFromDate:date];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            _data.sbp = [textField.text intValue];
            break;
        case 1:
            _data.dbp = [textField.text intValue];
            break;
        case 2:
            _data.pulseRate = [textField.text intValue];
            break;
        default:
            break;
    }
}
@end
