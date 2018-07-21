//
//  CameraCollView.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/21.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ShadeBootomView :UIView<UIGestureRecognizerDelegate>

@end

@interface CameraCollView : UIView
@property (strong, nonatomic) NSMutableArray *imgArr;
@end


