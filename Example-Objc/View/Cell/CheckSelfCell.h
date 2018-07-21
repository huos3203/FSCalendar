//
//  CheckSelfCell.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckSelfModel.h"

@protocol CheckSelfDelegate

@optional

@end


@interface CheckSelfCell : UITableViewCell
@property (strong, nonatomic) CheckSelfModel *checkModel;
@property (strong, nonatomic) id<CheckSelfDelegate> delegate;
//拍照广场
@property (strong, nonatomic) void(^AlertCameraView)(NSArray *);
@end
