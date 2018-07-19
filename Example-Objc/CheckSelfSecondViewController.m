//
//  CheckSelfSecondViewController.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckSelfSecondViewController.h"
#import "CheckSelfCell.h"

@interface CheckSelfSecondViewController ()<UITableViewDataSource,UITableViewDelegate,CheckSelfDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *ibCheckStatusImageView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;
@property (strong, nonatomic) IBOutlet UIView *ibTableHeaderView;


@end

@implementation CheckSelfSecondViewController

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
    return 5;
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
    cell.checkModel = [CheckSelfModel new];
    cell.delegate = self;
    return cell;
}



@end
