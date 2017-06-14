//
//  PlanTableViewCell.h
//  DfthSDKDemo
//
//  Created by liuyanmei on 17/5/18.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanTableViewCell : UITableViewCell

-(void)setObject:(NSString*)obj;

@property (nonatomic, assign) NSInteger row;

@property (nonatomic, strong) NSMutableArray<NSString *> *datasArr;

@property (nonatomic, copy) void (^updateDataBlock)();

@end
