//
//  CheckCameraCell.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/21.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraModel.h"

@interface CameraCell : UICollectionViewCell

@property (strong, nonatomic) CameraModel *model;
@property (strong, nonatomic) void(^DeleteCellBlock)(CameraModel *);


@end
