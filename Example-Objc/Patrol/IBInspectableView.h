//
//  IBInspectableView.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface IBInspectableView : UIView
-(void)drawBorderPath;
//圆角
@property (assign, nonatomic) IBInspectable BOOL roundBorder;
//描边虚线框
@property (assign, nonatomic) IBInspectable BOOL borderPath;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;
@end
