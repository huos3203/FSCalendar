//
//  CheckSelfModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    OptionalCheck,
    CheckPassed,
    NotPassed,
} CheckSelfStatus;
typedef enum : NSUInteger {
    SwitchType,
    PullType,
} CheckSelfCellType;
typedef enum : NSUInteger {
    SecondStep,
    ThirdStep,
} CheckStepType;

@class CameraModel;
@interface CheckSelfModel : NSObject
//是否可编辑
@property (assign, nonatomic) NSString *Id;
@property(assign,nonatomic)CheckStepType step;
@property(assign,nonatomic)CheckSelfStatus status;
@property (assign, nonatomic)CheckSelfCellType type;
@property (strong, nonatomic) NSMutableArray<CameraModel *> *imgArr;
@end
