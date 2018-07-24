//
//  InsReportModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/24.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>
@class InsOptModel;
@class ReformSignModel;
@interface InsReportModel : NSObject
-(instancetype)initWithDemo;
@property (strong, nonatomic) NSString *StoreId;
@property (strong, nonatomic) NSString *StoreName;
@property (strong, nonatomic) NSString *StoreSecTypeName;
@property (strong, nonatomic) NSString *StoreTypeName;
@property (strong, nonatomic) NSString *InspectTypeName;
@property (strong, nonatomic) NSString *InspectTypeId;
@property (strong, nonatomic) NSString *InspectDate;
@property (strong, nonatomic) NSString *CompleteDate;
@property (strong, nonatomic) NSString *YearTimes;
@property (strong, nonatomic) NSArray<InsOptModel *> *InsOpts;
@property (strong, nonatomic) NSArray<ReformSignModel *> *ReformSignature;
@property (strong, nonatomic) NSString *Remark;
@property (strong, nonatomic) NSString *Signature;
@end
