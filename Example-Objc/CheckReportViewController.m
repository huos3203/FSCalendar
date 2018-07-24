//
//  CheckReportViewController.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckReportViewController.h"
#import "BaseInfoModel.h"

@interface CheckReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *ibCheckSectionHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *ibTableView;
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
    return 4 + _noteSignNum;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number;
    if (section == 3+_noteSignNum) {
        return 1;
    }else{
        switch (section) {
            case 0:
//                number = self.baseInfo.infoArr.count;
                break;
            case 1:
//                number = self.checkList.count;
                break;
            default:
                number = 2;
                break;
        }
    }
    return number;
}



@end
