//
//  BaseInfoModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "ArchiveModel.h"
@interface BaseCellModel : ArchiveModel
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *checkNum;

@end

@interface ArchiveInfoModel:ArchiveModel
@property (strong, nonatomic) NSArray<BaseCellModel *> *infoArr;
@property (strong, nonatomic) NSString *StoreId;
@property (strong, nonatomic) NSString *StoreName; 
@property (strong, nonatomic) NSString *UserId;
@property (strong, nonatomic) NSString *UserName;
@property (strong, nonatomic) NSString *UserIcon;
@property (strong, nonatomic) NSString *InspectDate;
@property (strong, nonatomic) NSString *YearTimes;
@property (strong, nonatomic) NSString *InspectTypeName;
@property (strong, nonatomic) NSString *StoreTypeName;
@property (strong, nonatomic) NSString *StoreSecTypeName; //规模

@end

@interface BaseInfoModel : NSObject

@property (strong, nonatomic) NSString *StoreId;
@property (strong, nonatomic) NSString *StoreName;
@property (strong, nonatomic) NSString *StoreSecTypeId;
@property (strong, nonatomic) NSString *StoreSecTypeName;
@property (strong, nonatomic) NSString *StoreTypeId;
@property (strong, nonatomic) NSString *StoreTypeName;

@property (strong, nonatomic) NSString *UserId;
@property (strong, nonatomic) NSString *UserName;
@property (strong, nonatomic) NSString *UserIcon;

@property (strong, nonatomic) NSString *CompleteDate;
@property (strong, nonatomic) NSString *InspectDate;
@property (strong, nonatomic) NSString *InspectTypeId;
@property (strong, nonatomic) NSString *InspectTypeName;
@property (strong, nonatomic) NSString *IsReform;
@property (strong, nonatomic) NSString *YearTimes;
@property (strong, nonatomic) NSString *InspectTypeList;

@property (strong, nonatomic) ArchiveInfoModel *archiveModel;
@end
