//
//  AppDelegate.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/23.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    //注册异常和信号捕获
    [ExceptionUtils installUncaughtExceptionHandler];
    [ExceptionUtils InstallSignalHandler];
    
    [self initDfthSDK];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [DfthSDKManager destroy];
}

- (void)initDfthSDK{
    [DfthSDKManager init];
    
    [self oauth];
}

- (void)oauth{
    [GlobleData sharedInstance].clientId = @"b04bb81daa5047bc9f2554956e1d2b4c";
    [GlobleData sharedInstance].clientSecret = @"b996c7f022f64c70a6c82ede97a3f30a";
    DfthTask *task = [DfthSDKManager getOauthTaskWithClientId:[GlobleData sharedInstance].clientId clientSecret:[GlobleData sharedInstance].clientSecret completeHandler:^(DfthResult *result){
        if (result.code == DfthRC_Ok) {
            NSLog(@"认证成功");
            [self createUser];
        }else{
            NSLog(@"认证失败");
        }
    }];
    
    //    task.timeout = 10;
    [task async];
}

- (void)createUser
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy/MM/dd";
    NSDate *birthday = [df dateFromString:@"2010/01/01"];
    
    int gender = 1; //1：男，2：女     13555555555
    DfthTask *task = [DfthSDKManager getRegisterTaskWithUserName:@"iosSDK" gender:gender birthday:[birthday timeIntervalSince1970] mobile:@"13888888888" completeHandler:^(DfthResult * _Nonnull result, NSString * _Nonnull userId) {
        if (result.code == DfthRC_Ok) {
            NSLog(@"注册成功: %@", userId);
            [GlobleData sharedInstance].userId = userId;
            [GlobleData sharedInstance].dfthUser = [DfthSDKManager getUser:userId];
        }else{
            NSLog(@"注册失败");
        }
    }];
    
    //    task.timeout = 10;
    [task async];
}



@end
