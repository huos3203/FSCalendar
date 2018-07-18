//
//  CheckSelfModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    NotCheck,
    CheckPassed,
    NotPassed,
} CheckSelfStatus;
@interface CheckSelfModel : NSObject
//是否可编辑
@property (assign, nonatomic) BOOL IsFixed;
@property(assign,nonatomic)CheckSelfStatus status;
@end
