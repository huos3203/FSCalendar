//
//  CheckSelfThirdViewController.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckSelfThirdViewController.h"
#import "BaseInfoModel.h"
#import "BaseInfoCell.h"
#import "CheckSelfCell.h"
#import "CheckNoteCell.h"
#import "CheckReportViewController.h"

@interface CheckSelfThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *ibCheckSectionHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;

@end

@implementation CheckSelfThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView Datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    switch (section) {
        case 0:
            number = self.baseInfo.infoArr.count;
            break;
        case 1:
            number = self.checkList.count;
            break;
        default:
            number = 1;
            break;
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
        cellId = @"checkSelfCell";
        CheckSelfCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        CheckSelfModel *model = self.checkList[indexPath.row];
        model.step = ThirdStep;
        cell.checkModel = model;
        return cell;
    }
    //备注
    if (indexPath.section == 2) {
        CheckNoteCell *note = [tableView dequeueReusableCellWithIdentifier:@"CheckNoteCell"];
        return note;
    }
    
    //下一步
    if (indexPath.section == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepCell"];
        return cell;
    }
    return nil;
}
#pragma mark UI事件
- (IBAction)ibaBackBarAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)ibaCreateReportAction:(id)sender {
}



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

#pragma mark setter/getter
-(ArchiveInfoModel *)baseInfo{
    if (!_baseInfo) {
        //解档
        _baseInfo = [ArchiveInfoModel unArhive:[ArchiveInfoModel class]];
    }
    return _baseInfo;
}
@end
