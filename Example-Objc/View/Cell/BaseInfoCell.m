//
//  BaseInfoCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "BaseInfoCell.h"
#import "BaseInfoModel.h"
@interface BaseInfoCell()
@property (strong, nonatomic) IBOutlet UIImageView *ibIconImageView;
@property (strong, nonatomic) IBOutlet UILabel *ibTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ibCheckNumberLabel;

@end

@implementation BaseInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(BaseCellModel *)model
{
    _ibCheckNumberLabel.hidden = YES;
    _ibIconImageView.image = [UIImage imageNamed:model.icon];
    _ibNameLabel.text = model.name;
    _ibTitleLabel.text = model.title;
    if ([model.title isEqualToString:@"检查时间"]) {
        _ibCheckNumberLabel.hidden = NO;
        _ibCheckNumberLabel.text = model.checkNum;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
