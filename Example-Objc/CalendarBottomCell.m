//
//  CalendarBottomCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/17.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CalendarBottomCell.h"

@implementation CalendarBottomCell

-(void)awakeFromNib
{
    [super awakeFromNib];
    _ibTitleLabel.layer.cornerRadius = _ibTitleLabel.frame.size.width/2;
    _ibTitleLabel.layer.borderColor = [UIColor grayColor].CGColor;
    _ibTitleLabel.layer.borderWidth = .5;
    _ibTitleLabel.layer.masksToBounds = NO;
}

@end
