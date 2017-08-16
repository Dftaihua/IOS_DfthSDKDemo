//
//  MyFamilyViewController.m
//  DfthSDKDemo
//
//  Created by admin on 2017/6/19.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "MyFamilyViewController.h"

@interface MyFamilyViewController ()
{
    NSString *mid2;
    NSString *recordId;
    NSString *applyId;
    
}
@property (weak, nonatomic) IBOutlet UITextField *userIdTextField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UITextField *textField4;
@property (weak, nonatomic) IBOutlet UITextView *Log;



@end

@implementation MyFamilyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userIdTextField.text = [GlobleData sharedInstance].userId;
//    _deviceMac.text = @"A0:E6:F8:4E:40:C6";
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
}
- (void)tapClick
{
 
    if ([_userIdTextField isFirstResponder]) {
        [_userIdTextField resignFirstResponder];
    }
    
    if ([_textField2 isFirstResponder]) {
         [_textField2 resignFirstResponder];
    }
    
    if ([_textField3 isFirstResponder]) {
        [_textField3 resignFirstResponder];
    }
    
    if ([_textField4 isFirstResponder]) {
        [_textField4 resignFirstResponder];
    }
    
}

- (IBAction)FriendCount:(id)sender {
    
  DfthTask *task =  [DfthSDKManager getFriendCountTaskWith:_userIdTextField.text completeHandler:^(DfthResult * _Nonnull result, Response_FriendsCount * _Nullable friendsCount) {
      
      if (result.code == DfthRC_Ok) {
          NSMutableString *str = [[NSMutableString alloc] init];
              [str appendString:[NSString stringWithFormat:@"已有亲友数量：%d\n",friendsCount.haveCount]];
              [str appendString:[NSString stringWithFormat:@"上线：%d\n",friendsCount.count]];
          
          _Log.text = str;
      } else {
          _Log.text = result.message;
      }
    }];
    [task async];
}

- (IBAction)getMember:(id)sender {
    
   DfthTask *task = [DfthSDKManager getmemberTaskWith:@"18518562363" completeHandler:^(DfthResult * _Nonnull result, Response_getMember * _Nullable friendsList) {
       
       if (result.code == DfthRC_Ok) {
           NSMutableString *str = [[NSMutableString alloc] init];
           [str appendString:[NSString stringWithFormat:@"会员id：%@\n",friendsList.mid]];
           [str appendString:[NSString stringWithFormat:@"会员姓名：%@\n",friendsList.name]];
           [str appendString:[NSString stringWithFormat:@"性别：%ld\n",(long)friendsList.gender]];
           [str appendString:[NSString stringWithFormat:@"出生日期：%ld\n",friendsList.birthday]];
           [str appendString:[NSString stringWithFormat:@"头像地址：%@\n",friendsList.picture]];
           [str appendString:[NSString stringWithFormat:@"电话号码：%@\n",friendsList.telNumber]];
           mid2 = friendsList.mid;
           _Log.text = str;
           
       } else {
           _Log.text = result.message;
       }
       
    }];
    [task async];
    
}
- (IBAction)applyfriend:(id)sender {
    
    DfthTask *task =   [DfthSDKManager applyFriendTaskWith:_userIdTextField.text mid2:mid2 remark:@"哈哈哈哈" completeHandler:^(DfthResult * _Nonnull result) {
      
        _Log.text = result.message;
      
    }];
    [task async];
    
}
- (IBAction)findfriends:(id)sender {
    // 3890f8b95ded498f97a535ea209886c6
   DfthTask *task = [DfthSDKManager findFriendsTaskWith:_userIdTextField.text status:@"1" completeHandler:^(DfthResult * _Nonnull result, NSMutableArray<Response_FindFriends *> * _Nullable friendsList) {
       
       
       if (result.code == DfthRC_Ok) {
           NSMutableString *str = [[NSMutableString alloc] init];
           for (Response_FindFriends *deviceList in friendsList) {
               applyId = deviceList.id;
               [str appendString:[NSString stringWithFormat:@"会员id：%@\n",deviceList.id]];
               [str appendString:[NSString stringWithFormat:@"会员姓名：%@\n",deviceList.name]];
               [str appendString:[NSString stringWithFormat:@"性别：%ld\n",(long)deviceList.gender]];
               [str appendString:[NSString stringWithFormat:@"出生日期：%ld\n",deviceList.birthday]];
               [str appendString:[NSString stringWithFormat:@"头像地址：%@\n",deviceList.picture]];
               [str appendString:@"\n\n"];
           }
           _Log.text = str;
       } else {
            _Log.text = result.message;
       }
       
   }];
    [task async];
}

- (IBAction)findApplyList:(id)sender {
    // 没有用了
//   DfthTask *task = [DfthSDKManager findApplyListTaskWith:_userIdTextField.text completeHandler:^(DfthResult * _Nonnull result, NSMutableArray <Response_FindApplyList *>* _Nullable friendsList) {
//       
//       if (result.code == DfthRC_Ok) {
//           
//           if (result.code == DfthRC_Ok) {
//               NSMutableString *str = [[NSMutableString alloc] init];
//               for (Response_FindApplyList *deviceList in friendsList) {
//            
//           
//               [str appendString:[NSString stringWithFormat:@"申请记录id：%@\n",deviceList.id]];
//               [str appendString:[NSString stringWithFormat:@"申请时间：%ld\n",deviceList.saveTime]];
//               [str appendString:[NSString stringWithFormat:@"会员姓名：%@\n",deviceList.name]];
//               [str appendString:[NSString stringWithFormat:@"性别：%ld\n",(long)deviceList.gender]];
//               [str appendString:[NSString stringWithFormat:@"出生日期：%ld\n",deviceList.birthday]];
//               [str appendString:[NSString stringWithFormat:@"头像地址：%@\n",deviceList.picture]];
//               [str appendString:@"\n\n"];
//                   
//               }
//           _Log.text = str;
//                   
//       }
//       }
//           else {
//           _Log.text = result.message;
//       }
//       
//    }];
//    [task async];
    
}
- (IBAction)applyResult:(id)sender {
    
    // 1:申请通过；2：申请不通过；3：取消关注；
   DfthTask *task = [DfthSDKManager applyResultTaskWith:applyId status:@"1" completeHandler:^(DfthResult * _Nonnull result) {
       
       _Log.text = result.message;
       
    }];
    [task async];
}

- (IBAction)editFriend:(id)sender {
    
    DfthTask *task =  [DfthSDKManager editFriendTaskWith:applyId mid:mid2 nickname:@"哈哈" completeHandler:^(DfthResult * _Nonnull result) {
        
        _Log.text = result.message;
        
    }];
    [task async];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
