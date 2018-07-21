//
//  CheckCameraCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/21.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CameraCell.h"
#import "CameraModel.h"


@interface CameraCell()
@property (strong, nonatomic) IBOutlet UIButton *ibAddBut;
@property (strong, nonatomic) IBOutlet UIButton *ibDelBut;
@end

@implementation CameraCell

#pragma mark UI事件
- (IBAction)ibaDelButAction:(id)sender {
    if (self.DeleteCellBlock) {
        self.DeleteCellBlock(self.model);
    }
}

#pragma mark getter/setter
-(void)setModel:(CameraModel *)model
{
    _model = model;
    [self.ibAddBut.imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.ibAddBut setImage:model.image forState:UIControlStateNormal];
    self.ibDelBut.hidden = model.hideDel;
}


@end
