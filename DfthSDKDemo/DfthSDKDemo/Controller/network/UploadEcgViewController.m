//
//  UploadEcgViewController.m
//  DfthSDKDemo
//
//  Created by yue gao on 2017/3/29.
//  Copyright © 2017年 yue gao. All rights reserved.
//

#import "UploadEcgViewController.h"

@interface UploadEcgViewController ()
@property (weak, nonatomic) IBOutlet UITextView *log;
@property (weak, nonatomic) IBOutlet UITextField *page;
@property (weak, nonatomic) IBOutlet UITextField *count;
@property (weak, nonatomic) IBOutlet UITextField *index;
@property (assign, nonatomic) int progress;
@property (strong, nonatomic) DfthTask *task;
@property (assign, nonatomic) NSTimeInterval uploadTime;

@property (strong, nonatomic) NSArray<DfthEcgRecord*> *records;
@end

@implementation UploadEcgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _page.text = @"1";
    _count.text = @"5";
    _index.text = @"0";
    _log.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)queryRecrods:(id)sender {
#if 0
    _records = [DfthSDKManager getUser:[GlobleData sharedInstance].userId  leadCount:1 ecgRecordsAtPage:[_page.text intValue] whichContains:[_count.text intValue]];

    for (int i = 0; i < _records.count; i++) {
        _log.text = [_log.text stringByAppendingFormat:@"序号：%d\n", i];
        _log.text = [_log.text stringByAppendingFormat:@"%@\n", _records[i]];
    }
#else
    _log.text = @"";
    DfthTask *task = [DfthSDKManager getUser:[GlobleData sharedInstance].userId pageIndex:[_page.text intValue] pageSize:[_count.text intValue] startTime:-1 endTime:-1 leadCount:1 sort:nil complete:^(DfthResult * _Nonnull result, BOOL isLastPage, NSArray<DfthEcgRecord *> * _Nullable recordArray) {
        
//        if (result.code == DfthRC_Ok) {
//
//        }else{
//            _log.text = result.message;
//        }
        _records = recordArray;
        for (int i = 0; i < _records.count; i++) {
            _log.text = [_log.text stringByAppendingFormat:@"序号：%d\n", i];
            _log.text = [_log.text stringByAppendingFormat:@"%@\n", _records[i]];
        }
    }];

    [task async];
#endif
}

- (IBAction)upload:(id)sender {
    DfthEcgRecord *record = _records[[_index.text intValue]];
    DfthTask *task = [DfthSDKManager ecgUploadRecord:record progress:^(NSProgress * _Nonnull progress) {
        _log.text = [NSString stringWithFormat:@"正在上传：%f", progress.fractionCompleted];
//        NSLog(@"正在上传：%f", progress.fractionCompleted);

    } completeHandler:^(DfthResult * _Nonnull result, DfthEcgRecord * _Nullable record) {
        if (result.code == DfthRC_Ok) {
            _log.text = [NSString stringWithFormat:@"上传成功：%@", record];
        }else{
            _log.text = [NSString stringWithFormat:@"上传失败：%@", result];
        }
        NSTimeInterval finishTime = [[NSDate date] timeIntervalSince1970];
        
        _log.text = [NSString stringWithFormat:@"%@\n 用时:%f(s)", _log.text, (finishTime - _uploadTime)];
    }];
    _uploadTime = [[NSDate date] timeIntervalSince1970];
    [task async];
}
- (IBAction)uploadComplete:(id)sender {
//    DfthEcgRecord *record = _records[[_index.text intValue]];
//    DfthTask *task = [DfthSDKManager uploadComplete:record complete:^(DfthResult * _Nonnull result) {
//        _log.text = [NSString stringWithFormat:@"执行结果：%@", result];
//    }];
//    [task async];
}
- (IBAction)createTask:(id)sender {
    DfthEcgRecord *record = _records[[_index.text intValue]];
    DfthTask *task = [DfthSDKManager ecgCreateTaskForRecord:record completeHandler:^(DfthResult * _Nonnull result, DfthEcgRecord * _Nullable record)  {
        if (result.code == DfthRC_Ok) {
            _log.text = [NSString stringWithFormat:@"创建任务成功：%@", record];
        }else{
            _log.text = [NSString stringWithFormat:@"创建任务失败：%@", result];
        }
    }];
    [task async];
}

- (NSData *)getData:(NSString *)path offset:(int)offset{
    NSLog(@"文件偏移: %d", offset);
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    __block NSData *data = nil;
    dispatch_barrier_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            [fileHandle seekToFileOffset:offset];
            data = [fileHandle readDataToEndOfFile];
            [fileHandle closeFile];
        }
    });
    NSLog(@"数据量: %ld", (unsigned long)data.length);
    return data;
}

- (IBAction)getServiceResult:(id)sender {
    DfthEcgRecord *r = _records[[_index.text intValue]];
    DfthTask *task = [DfthSDKManager getEcgServiceWithRecordId:r.recordId userId:r.userId complete:^(DfthResult * _Nonnull result, DfthEcgRecord * _Nullable record){
        if (result.code == DfthRC_Ok) {
            _log.text = record.description;
        }else{
            _log.text = [NSString stringWithFormat:@"执行失败：%@", result];
        }
    }];
    [task async];
}

- (IBAction)downloadZipFile:(id)sender {
    DfthEcgRecord *r = _records[[_index.text intValue]];
    _task = [DfthSDKManager ecgDownloadZipFile:r progress:^(NSProgress * _Nonnull progress) {
        _log.text = [NSString stringWithFormat:@"下载进度:%f", progress.fractionCompleted];
    } complete:^(DfthResult * _Nonnull result, DfthEcgRecord * _Nullable record) {
        if (result.code == DfthRC_Ok) {
            _log.text = [NSString stringWithFormat:@"下载成功, %@", record];
        }else{
            _log.text = [NSString stringWithFormat:@"文件下载执行失败：%@", result];
        }
    }];
    [_task async];
}

- (IBAction)deleteRecord:(id)sender {
    
    DfthEcgRecord *r = _records[[_index.text intValue]];
    NSArray *records = [[NSArray alloc] initWithObjects:r, _records.lastObject, nil];
    _task = [DfthSDKManager ecgDeleteRecords:records complete:^(DfthResult * _Nonnull result, NSMutableArray<DfthEcgRecord *> * _Nullable deletedRecords) {
        NSLog(@"result=%@", result);
        if (result.code == DfthRC_Ok) {
            _log.text = [NSString stringWithFormat:@"删除文件成功, %d", (int)deletedRecords.count];
        }else{
            _log.text = [NSString stringWithFormat:@"删除文件失败：%d", (int)deletedRecords.count];
        }
    }];
    [_task async];
}

- (IBAction)downloadIni:(id)sender {
    DfthEcgRecord *r = _records[[_index.text intValue]];
//    _task = [DfthSDKManager ecgDownloadFile:r suffix:@".ini" progress:^(NSProgress * _Nonnull progress) {
//        _log.text = [NSString stringWithFormat:@"正在下载ini文件:%f", progress.fractionCompleted];
//    } complete:^(DfthResult * _Nonnull result, NSString * _Nullable filePath){
//        if (result.code == DfthRC_Ok) {
//            _log.text = [NSString stringWithFormat:@"下载ini文件成功, %@", filePath];
//        }else{
//            _log.text = [NSString stringWithFormat:@"下载ini文件失败：%@", result];
//        }
//    }];
//    [_task async];
}

- (IBAction)downloadDat:(id)sender {
    DfthEcgRecord *r = _records[[_index.text intValue]];
//    _task = [DfthSDKManager ecgDownloadFile:r suffix:@".dat" progress:^(NSProgress * _Nonnull progress) {
//        _log.text = [NSString stringWithFormat:@"正在下载dat文件:%f", progress.fractionCompleted];
//    } complete:^(DfthResult * _Nonnull result, NSString * _Nullable filePath) {
//        if (result.code == DfthRC_Ok) {
//            _log.text = [NSString stringWithFormat:@"下载dat文件成功, %@", filePath];
//        }else{
//            _log.text = [NSString stringWithFormat:@"下载dat文件失败：%@", result];
//        }
//    }];
//    [_task async];
}
- (IBAction)statistic:(id)sender {
    DfthEcgRecord *r = _records[[_index.text intValue]];
//    [DfthSDKManager statisticForRecord:r];
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
