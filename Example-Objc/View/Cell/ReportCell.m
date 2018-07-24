//
//  ReportCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "ReportCell.h"
#import "InsOptModel.h"
#import "CameraModel.h"

@interface ReportCell()
@property (strong, nonatomic) IBOutlet UIButton *ibPaizhaoButton;
@property (strong, nonatomic) IBOutlet UILabel *ibTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibRemarkLabel;
@property (strong, nonatomic) IBOutlet UIView *ibPullView;
@property (strong, nonatomic) IBOutlet UIButton *ibSaveButton;
@property (strong, nonatomic) IBOutlet UIView *ibImgNumberView;
@property (strong, nonatomic) IBOutlet UILabel *ibImgNumberLabel;
@end

@implementation ReportCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //描边
    _ibSaveButton.layer.cornerRadius = 10;
    _ibSaveButton.layer.masksToBounds = YES;
}

-(void)setModel:(InsOptModel *)model{
    _model = model;
    _ibTitleLabel.text = model.Text;
    _ibRemarkLabel.text = model.Remark;
    if (model.picsArr.count > 0) {
        _ibImgNumberView.hidden = NO;
        _ibPaizhaoButton.hidden = NO;
        _ibImgNumberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.picsArr.count];
        CameraModel *imgModel = model.picsArr[0];
        [_ibPaizhaoButton setImage:imgModel.image forState:UIControlStateNormal];
    }else{
        _ibImgNumberView.hidden = YES;
        _ibPaizhaoButton.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ibaPaizhaoAction:(id)sender {
    if (_model.picsArr.count > 0) {
        if (self.AlertCameraView) {
            self.AlertCameraView(self.model.picsArr);
        }
    }
}

- (IBAction)ibAddRemarkAction:(id)sender {
    
}

@end
