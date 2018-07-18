//
//  IBInspectableView.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "IBInspectableView.h"

@implementation IBInspectableView

-(void)prepareForInterfaceBuilder
{
    
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
}
-(void)setRoundBorder:(BOOL)roundBorder
{
    if (roundBorder) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
    }
}
-(void)drawBorderPath
{
    if (_borderPath) {
        CAShapeLayer *viewBorder = [CAShapeLayer layer];
        viewBorder.strokeColor = _borderColor.CGColor;
        viewBorder.fillColor = nil;
        viewBorder.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
        viewBorder.frame = self.bounds;
        viewBorder.lineWidth = 1.f;
        viewBorder.lineCap = @"square";
        viewBorder.lineDashPattern = @[@3, @4];
        [self.layer addSublayer:viewBorder];
    }
}

@end
