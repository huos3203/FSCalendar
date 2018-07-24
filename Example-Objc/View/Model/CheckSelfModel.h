//
//  CheckSelfModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "ArchiveModel.h"
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

@interface SelfInspectModel:NSObject
@property (strong, nonatomic) NSString *Id;
@property (assign, nonatomic) BOOL IsNeedPic;    //是否拍照
@property (assign, nonatomic) BOOL IsNotForAll; //合理缺项
@property (strong, nonatomic) NSString *Text;
@end
@class CameraModel;
@interface CheckSelfModel : ArchiveModel
-(instancetype)initWithModel:(SelfInspectModel *)model;
@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *Pictures;
@property (strong, nonatomic) NSString *Text;
@property(assign,nonatomic)CheckStepType step;
@property(assign,nonatomic)CheckSelfStatus status;
@property (assign, nonatomic)CheckSelfCellType type;
@property (strong, nonatomic) NSNumber *IsNeedPic;   
@property (strong, nonatomic) NSMutableArray<CameraModel *> *imgArr;
@end
