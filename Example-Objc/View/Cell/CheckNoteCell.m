//
//  CheckNoteCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckNoteCell.h"
#import "ReformSignModel.h"

@interface CheckNoteCell()
@property (strong, nonatomic) IBOutlet UILabel *ibNoteTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibSignTitleLabel;
@property (strong, nonatomic) IBOutlet UIView *ibNoteView;
@property (strong, nonatomic) IBOutlet UIButton *ibSignButton;

@end

@implementation CheckNoteCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(ReformSignModel *)model
{
    _model = model;
    _ibNoteTitleLabel.text = [model.RoleName stringByAppendingString:@"意见"];
    _ibSignTitleLabel.text = [model.RoleName stringByAppendingString:@"签字"];
    [_ibSignButton setImage:[UIImage new] forState:UIControlStateNormal];
}

@end
