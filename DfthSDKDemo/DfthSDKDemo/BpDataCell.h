//
//  BpDataCell.h
//  DfthSDKDemo
//
//  Created by gaoyue on 2017/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BpDataCell : UITableViewCell <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *sbp;
@property (weak, nonatomic) IBOutlet UITextField *dbp;
@property (weak, nonatomic) IBOutlet UITextField *pulseRate;
@property (strong, nonatomic) DfthBpData *data;

- (void)displayWithData:(DfthBpData *)bpData;
@end
