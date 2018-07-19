//
//  CheckSelfCell.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckSelfCell.h"

@interface CheckSelfCell()
@property (strong, nonatomic) IBOutlet UIButton *ibPaizhaoButton;
@property (strong, nonatomic) IBOutlet UILabel *ibTitleLabel;
@property (strong, nonatomic) IBOutlet UIButton *ibSwitchButton;
@property (strong, nonatomic) IBOutlet UIButton *ibPullButton;
@property (strong, nonatomic) IBOutlet UIView *ibPullView;
@property (strong, nonatomic) IBOutlet UILabel *ibPullTypeLabel;
@property (strong, nonatomic) IBOutlet UIButton *ibNextStepButton;
@property (strong, nonatomic) IBOutlet UIView *ibImgNumberView;
@property (strong, nonatomic) IBOutlet UILabel *ibImgNumberLabel;

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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCheckModel:(CheckSelfModel *)checkModel
{
    _checkModel = checkModel;
    if (checkModel.type != SwitchType) {
        _ibPullView.hidden = YES;
        _ibSwitchButton.hidden = NO;
        _ibSwitchButton.selected = checkModel.status == CheckPassed?YES:NO;
    }else{
        _ibPullView.hidden = NO;
        _ibSwitchButton.hidden = YES;
        NSString *typeNam = @"";
        switch (1) {
            case OptionalCheck:
                typeNam = @"合理缺项";
                break;
            case CheckPassed:
                typeNam = @"是";
                break;
            default:
                typeNam = @"否";
                break;
        }
        _ibPullTypeLabel.text = typeNam;
    }
    
    //拍照按钮初始化
    if (_checkModel.imgArr.count > 0) {
        _ibImgNumberView.hidden = NO;
        _ibImgNumberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)_checkModel.imgArr.count];
        CheckImgModel *imgModel = _checkModel.imgArr[0];
        [_ibPaizhaoButton setImage:imgModel.image forState:UIControlStateNormal];
    }else{
        _ibImgNumberView.hidden = YES;
        [_ibPaizhaoButton setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    }
}
- (IBAction)ibaPaizhaoAction:(id)sender {

    if (_checkModel.imgArr.count > 0) {
        //TODO:预览
        NSMutableArray *previewArr = [NSMutableArray new];
        for (CheckImgModel *path in _checkModel.imgArr) {
            [previewArr addObject:path];
        }
        
    }else{
        //TODO: 拍照

    }
}


- (IBAction)ibCheckDetailAction:(id)sender {
    //TODO:检查项详情
}

- (IBAction)ibCheckStatusAction:(id)sender {
    if (!_ibSwitchButton.selected) {
        _ibSwitchButton.selected = YES;
        _checkModel.status = CheckPassed;
    }else{
        _ibSwitchButton.selected = NO;
        _checkModel.status = NotPassed;
    }
}
- (IBAction)ibaHeliquexiangAction:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [self addActionTo:alertController from:@[@"是",@"否",@"合理缺项"]];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    UIViewController *deleVC = (UIViewController *)_delegate;
    [deleVC presentViewController:alertController animated:YES completion:nil];
}
-(void)addActionTo:(UIAlertController *)alertVC from:(NSArray *)titleArr
{
    for (NSString *title in titleArr) {
        __weak typeof(self) weakSelf = self;
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            weakSelf.ibPullTypeLabel.text = title;
            if ([title isEqualToString:@"是"]) {
                weakSelf.checkModel.status = CheckPassed;
            }else if([title isEqualToString:@"否"]){
                weakSelf.checkModel.status = NotPassed;
            }else{
             weakSelf.checkModel.status = OptionalCheck;
            }
        }];
        [action setValue:[UIColor darkGrayColor] forKey:@"titleTextColor"];
        [alertVC addAction:action];
    }
}

@end
