//
//  EcgNetRecord.h
//  DfthNetwork
//
//  Created by yue gao on 2017/4/20.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EcgNetRecord : NSObject
@property (nonatomic, copy) NSString *id;   //心电id
@property (nonatomic, copy) NSString *mId;  //用户id
@property (nonatomic, assign) int line; //导联数[1:单导心电,12:12导心电]
@property (nonatomic, assign) int64_t measuringBegin;  //开始测量时间,单位毫秒
@property (nonatomic, assign) int64_t measuringEnd;    //结束测量时间,单位毫秒
@property (nonatomic, assign) int spCount;  //室上性早搏次数
@property (nonatomic, assign) int pvcCount; //室性早搏次数
@property (nonatomic, assign) int heartBeatCount;   //总心拍数
@property (nonatomic, assign) int heartRateMax; //最高心率
@property (nonatomic, assign) int heartRateMin; //最低心率
@property (nonatomic, assign) int heartRateAvg; //平均心率
@property (nonatomic, copy) NSString *diseases; //异常问题
@property (nonatomic, assign) int score;    //心电指数
@property (nonatomic, copy) NSString *symptom;  //症状代码
@property (nonatomic, assign) int symptomLast;  //身体症状持续时间(秒)
@property (nonatomic, copy) NSString *wId;  //服务平台服务人员ID
@property (nonatomic, copy) NSString *wName;    //服务平台服务人姓名
@property (nonatomic, assign) int64_t analysisTime; //分析时间,单位毫秒
@property (nonatomic, copy) NSString *analysis; //分析结果
@property (nonatomic, copy) NSString *mac;  //mac地址
@property (nonatomic, assign) int64_t saveTime;    //保存时间

@property (nonatomic, copy) NSString *appid;
@property (nonatomic, copy) NSString *sourceApp;
@property (nonatomic, assign) int64_t lastModifyTime;   //标识ini和dat的最后修改时间, 单位毫秒
@property (nonatomic, copy) NSString *status;   //医师分析状态码
@property (nonatomic, assign) int64_t statusModify;
@property (nonatomic, copy) NSString *w_no;   //医师工号
@end
