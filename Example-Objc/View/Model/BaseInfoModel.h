//
//  BaseInfoModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BaseCellModel : NSObject
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *checkNum;

@end

@interface BaseInfoModel : NSObject
@property (strong, nonatomic) NSString *storeName;
@property (strong, nonatomic) NSString *checkType;
@property (strong, nonatomic) NSString *checkDate;
@property (strong, nonatomic) NSString *storeType;
@property (strong, nonatomic) NSArray<BaseCellModel *> *infoArr;
@end
