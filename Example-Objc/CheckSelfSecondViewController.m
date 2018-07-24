//
//  CheckSelfSecondViewController.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckSelfSecondViewController.h"
#import "CheckSelfThirdViewController.h"
#import "CheckSelfCell.h"
#import "CameraCollView.h"
#import "ArchiveModel.h"

@interface CheckSelfSecondViewController ()<UITableViewDataSource,UITableViewDelegate,CheckSelfDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *ibCheckStatusImageView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;
@property (strong, nonatomic) IBOutlet UIView *ibTableHeaderView;
@property (strong, nonatomic) NSMutableArray<CheckSelfModel *> *checkList;
@property (strong, nonatomic) NSMutableArray *inpectArr;

@property (strong, nonatomic) IBOutlet ShadeBootomView *ibCameraView;
@property (strong, nonatomic) IBOutlet CameraCollView *ibCameraCollectionView;

@end

@implementation CheckSelfSecondViewController
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString *path = [ArchiveModel pathOf:NSStringFromClass([self class])];
    //将数据归档到path文件路径里面
    BOOL success = [NSKeyedArchiver archiveRootObject:self.checkList toFile:path];
    if (success) {
        NSLog(@"归档成功");
    }else {
        NSLog(@"归档失败");
    }
    [self setNavigationBarType:NO];
}
- (IBAction)ibaBackBarAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark tableView data
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    return self.checkList.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return _ibTableHeaderView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 60;
    }else{
        return 0.01;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NextStepCell"];
        return cell;
    }
    CheckSelfCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkSelfCell"];
    CheckSelfModel *check = self.checkList[indexPath.row];
    check.step = SecondStep;
    cell.checkModel = check;
    __weak typeof(self) weakSelf = self;
    cell.AlertCameraView = ^(NSArray *imgArr) {
        [weakSelf alertCameraView];
        weakSelf.ibCameraCollectionView.imgArr = [imgArr mutableCopy];
    };
    cell.delegate = self;
    return cell;
}

#pragma mark segue事件
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CheckSelfThirdViewController"]) {
        //
        CheckSelfThirdViewController *third = segue.destinationViewController;
        third.checkList = self.checkList;
    }
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

#pragma mark setter/getter
-(NSMutableArray *)checkList
{
    if (!_checkList) {
        NSString *path = [ArchiveModel pathOf:NSStringFromClass([self class])];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            _checkList =  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        }else{
            _checkList = [NSMutableArray new];
            for (SelfInspectModel *model in self.inpectArr) {
                CheckSelfModel *check = [[CheckSelfModel alloc] initWithModel:model];
                [_checkList addObject:check];
            }
        }
    }
    return _checkList;
}
-(NSMutableArray *)inpectArr
{
    if (!_inpectArr) {
        _inpectArr = [NSMutableArray new];
        SelfInspectModel *model1 = [SelfInspectModel new];
        model1.IsNeedPic = NO;
        model1.IsNotForAll = YES;
        model1.Text = @"中华小当家";
        model1.Id = @"12323";
        SelfInspectModel *model2 = [SelfInspectModel new];
        model2.IsNeedPic = NO;
        model2.IsNotForAll = YES;
        model2.Text = @"中华小当家";
        model2.Id = @"12323";
        SelfInspectModel *model3 = [SelfInspectModel new];
        model3.IsNeedPic = YES;
        model3.IsNotForAll = NO;
        model3.Text = @"中华小当家";
        model3.Id = @"12323";
        SelfInspectModel *model4 = [SelfInspectModel new];
        model4.IsNeedPic = YES;
        model4.IsNotForAll = NO;
        model4.Text = @"中华小当家";
        model4.Id = @"12323";
        [_inpectArr addObjectsFromArray:@[model1,model2,model3,model4]];
    }
    return _inpectArr;
}

@end
