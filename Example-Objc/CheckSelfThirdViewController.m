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
#import "CheckSignCell.h"

@interface CheckSelfThirdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *ibCheckSectionHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;

@end

@implementation CheckSelfThirdViewController
{
    BaseInfoModel *_baseInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _baseInfo = [BaseInfoModel new];
    _baseInfo.storeName = @"庆丰包子铺上地店";
    _baseInfo.checkType = @"常规检查";
    _baseInfo.checkDate = @"2018.12.3 12:50";
    _baseInfo.storeType = @"学校食堂";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView Datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    switch (section) {
        case 0:
            number = _baseInfo.infoArr.count;
            break;
        case 1:
            number = 4;
            break;
        case 2:
            number = 1;
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
        cell.model = _baseInfo.infoArr[indexPath.row];
        return cell;
    }
    //检查列表
    if (indexPath.section == 1) {
        cellId = @"checkSelfCell";
        CheckSelfCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        cell.checkModel = [CheckSelfModel new];
        return cell;
    }
    //备注
    if (indexPath.section == 2) {
        CheckNoteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CheckNoteCell"];
        return cell;
    }
    //签名
    if (indexPath.section == 3) {
        CheckSignCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CheckSignCell"];
        return cell;
    }
    
    //下一步
    if (indexPath.section == 4) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepCell"];
        return cell;
    }
    return nil;
}
- (IBAction)ibaBackBarAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

@end
