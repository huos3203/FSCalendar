//
//  CheckReportViewController.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckReportViewController.h"
#import "BaseInfoModel.h"
#import "InsReportModel.h"
#import "BaseInfoCell.h"
#import "CheckSelfCell.h"
#import "CheckNoteCell.h"
#import "CameraCollView.h"
#import "ReportCell.h"
#import "EditRemarkView.h"
@interface CheckReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *ibCheckSectionHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;
@property (strong, nonatomic) InsReportModel *reportModel;

@property (strong, nonatomic) IBOutlet ShadeBootomView *ibCameraView;
@property (strong, nonatomic) IBOutlet CameraCollView *ibCameraCollectionView;

@property (strong, nonatomic) ArchiveInfoModel *baseInfo;

@property (strong, nonatomic) IBOutlet ShadeBootomView *ibAddRemarkView;
@property (strong, nonatomic) IBOutlet EditRemarkView *ibEditRemarkView;

@end

@implementation CheckReportViewController
{
    NSInteger _noteSignNum; //签名备注底部列表个数
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView Datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4 + self.reportModel.ReformSignature.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    if (section == 3+_noteSignNum) {
        return 1;
    }else{
        switch (section) {
            case 0:
                number = self.baseInfo.infoArr.count;
                break;
            case 1:
                number = self.reportModel.InsOpts.count;
                break;
            default:
                number = 1;
                break;
        }
    }
    return number;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 50;
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return _ibCheckSectionHeaderView;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //下一步
    if (indexPath.section == 3 + _noteSignNum) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepCell"];
        return cell;
    }
    
    NSString *cellId = @"BaseInfoCell";
    //基础信息
    if (indexPath.section == 0) {
        cellId = @"BaseInfoCell";
        BaseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        cell.model = self.baseInfo.infoArr[indexPath.row];
        return cell;
    }
    //检查列表
    if (indexPath.section == 1) {
        ReportCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReportCell"];
        InsOptModel *check = self.reportModel.InsOpts[indexPath.row];
        cell.model = check;
        __weak typeof(self) weakSelf = self;
        cell.AlertCameraView = ^(NSArray *imgArr) {
            [weakSelf alertCameraView];
            weakSelf.ibCameraCollectionView.imgArr = [imgArr mutableCopy];
        };
        cell.AlertRemarkBlock = ^(NSString *str) {
            [weakSelf alertRemarkView];
        };
        return cell;
    }
    //备注
    if (indexPath.section >= 2) {
        CheckNoteCell *note = [tableView dequeueReusableCellWithIdentifier:@"CheckNoteCell"];
        note.model = self.reportModel.ReformSignature[indexPath.row];
        return note;
    }
    
    return nil;
}

#pragma mark 拍照广场页面
-(void)alertCameraView
{
    _ibCameraView.frame = [UIScreen mainScreen].bounds;
    _ibCameraView.alpha = 0;
    [self.view addSubview:_ibCameraView];
    [UIView transitionWithView:_ibCameraCollectionView
                      duration:.5
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        _ibCameraView.alpha = 1;
                    } completion:^(BOOL finished) {
                        
                    }];
}

-(void)alertRemarkView
{
    _ibAddRemarkView.frame = [UIScreen mainScreen].bounds;
    _ibAddRemarkView.alpha = 0;
    [self.view addSubview:_ibAddRemarkView];
    [UIView transitionWithView:_ibEditRemarkView
                      duration:.5
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        _ibAddRemarkView.alpha = 1;
                    } completion:^(BOOL finished) {
                        
                    }];
}
#pragma mark setter/getter
-(InsReportModel *)reportModel
{
    if (!_reportModel) {
        _reportModel = [[InsReportModel alloc] initWithDemo];
        _noteSignNum = _reportModel.ReformSignature.count;
    }
    return _reportModel;
}
-(ArchiveInfoModel *)baseInfo
{
    if (!_baseInfo) {
        _baseInfo = [ArchiveInfoModel new];
        _baseInfo.StoreName = self.reportModel.StoreName;
        _baseInfo.StoreTypeName = self.reportModel.StoreTypeName;
        _baseInfo.YearTimes = self.reportModel.YearTimes;
        _baseInfo.InspectDate = self.reportModel.InspectDate;
        _baseInfo.InspectTypeName = self.reportModel.InspectTypeName;
    }
    return _baseInfo;
}
#pragma mark Navbar样式
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBarType:YES];
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self setNavigationBarType:NO];
}

-(void)setNavigationBarType:(BOOL)isClear
{
    self.navigationController.navigationBar.translucent = YES;
    UIColor *color = isClear?[UIColor clearColor]:[UIColor whiteColor];
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.clipsToBounds = isClear;
}

- (IBAction)ibaBackBarAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
