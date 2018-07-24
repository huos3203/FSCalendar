//
//  ReportCell.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InsOptModel;
@interface ReportCell : UITableViewCell
@property (strong, nonatomic) InsOptModel *model;
//拍照广场
@property (strong, nonatomic) void(^AlertCameraView)(NSArray *);
@property (strong, nonatomic) void (^AlertRemarkBlock)(NSString *);
@end
