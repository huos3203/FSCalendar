//
//  CheckSelfCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckSelfCell.h"
#import "CheckSelfModel.h"

@interface CheckSelfCell()
@property (strong, nonatomic) IBOutlet UIButton *ibPaizhaoButton;
@property (strong, nonatomic) IBOutlet UILabel *ibTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *ibSwitchButton;
@property (strong, nonatomic) IBOutlet UIButton *ibNextStepButton;

@end

@implementation CheckSelfCell
{
    CAShapeLayer *_signatureViewBorder;
    BOOL _isPassed;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //描边
    _ibNextStepButton.layer.cornerRadius = 10;
    _ibNextStepButton.layer.masksToBounds = YES;
    [self addViewBorder:_ibPaizhaoButton];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)addViewBorder:(UIView *)view
{
    if (!_signatureViewBorder && !_isPassed) {
        _signatureViewBorder = [CAShapeLayer layer];
        UIColor *grayColor = [UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f];
        _signatureViewBorder.strokeColor = grayColor.CGColor;
        _signatureViewBorder.fillColor = nil;
        _signatureViewBorder.path = [UIBezierPath bezierPathWithRect:view.bounds].CGPath;
        _signatureViewBorder.frame = view.bounds;
        _signatureViewBorder.lineWidth = 1.f;
        _signatureViewBorder.lineCap = @"square";
        _signatureViewBorder.lineDashPattern = @[@4, @3];
    }
    [view.layer addSublayer:_signatureViewBorder];
}
-(void)removeViewBorder:(UIView *)view
{
    [view.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == _signatureViewBorder) {
            *stop = YES;
            [_signatureViewBorder removeFromSuperlayer];
        }
    }];
    
}
- (IBAction)ibCheckDetailAction:(id)sender {
   
}

- (IBAction)ibCheckStatusAction:(id)sender {
    if (_checkModel.IsFixed) return;
    if (!_ibSwitchButton.selected) {
        _ibSwitchButton.selected = YES;
        _checkModel.status = CheckPassed;
    }else{
        _ibSwitchButton.selected = NO;
        _checkModel.status = NotPassed;
    }
}


@end
