//
//  CheckSelfThirdViewController.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArchiveInfoModel;
@interface CheckSelfThirdViewController : UIViewController
//通过传递初始化
@property (strong, nonatomic) NSMutableArray *checkList;
//通过解档初始化
@property (strong, nonatomic) ArchiveInfoModel *baseInfo;
@end
