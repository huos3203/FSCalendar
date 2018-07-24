//
//  BaseInfoModel.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/19.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "BaseInfoModel.h"
@implementation BaseCellModel
@end

@interface ArchiveInfoModel()
@property (strong, nonatomic) NSArray *nameArr;
@end
@implementation ArchiveInfoModel

-(NSArray<BaseCellModel *> *)infoArr{
    if (!_infoArr) {
        NSMutableArray *cellArr = [NSMutableArray new];
        NSArray *titleArr = @[@"经营者名称",@"自查类型",@"检查时间",@"业态类型"];
        NSArray *iconArr = @[@"经营者名称",@"自查类型",@"检查次数",@"业态类型"];
        for (int i = 0; i < 4; i++) {
            BaseCellModel *cell = [BaseCellModel new];
            cell.title = titleArr[i];
            cell.icon = iconArr[i];
            cell.name = self.nameArr[i];
            cell.checkNum = self.nameArr.lastObject;
            [cellArr addObject:cell];
        }
        _infoArr = [cellArr copy];
    }
    return _infoArr;
}
-(NSArray *)nameArr
{
    if (!_nameArr) {
        NSMutableArray *arr = [NSMutableArray new];
        [arr addObject:_StoreName];
        [arr addObject:_InspectTypeName];
        [arr addObject:_InspectDate];
        [arr addObject:_StoreTypeName];
        [arr addObject:_YearTimes];
        _nameArr = [arr copy];
    }
    return _nameArr;
}
-(NSString *)YearTimes
{
    if (![_YearTimes hasPrefix:@"本"]) {
        _YearTimes = [NSString stringWithFormat:@"本年度第%@次检查",_YearTimes];
    }
    return _YearTimes;
}
@end


@implementation BaseInfoModel

-(ArchiveInfoModel *)archiveModel
{
    if (!_archiveModel) {
        _archiveModel = [ArchiveInfoModel new];
        _archiveModel.StoreId = _StoreId;
        _archiveModel.StoreName = _StoreName;
        _archiveModel.StoreTypeName = _StoreTypeName;
        _archiveModel.StoreSecTypeName = _StoreSecTypeName;
        _archiveModel.UserId = _UserId;
        _archiveModel.UserName = _UserName;
        _archiveModel.UserIcon = _UserIcon;
        _archiveModel.InspectDate = _InspectDate;
        _archiveModel.YearTimes = _YearTimes;
        _archiveModel.InspectTypeName = _InspectTypeName;
        //
        _archiveModel.StoreId = @"1234";
        _archiveModel.StoreName = @"庆丰包子铺上地店";
        _archiveModel.StoreTypeName = @"普查";
        _archiveModel.StoreSecTypeName = @"500人";
        _archiveModel.UserId = @"userid";
        _archiveModel.UserName = @"张三丰";
        _archiveModel.UserIcon = @"http://www.img.png";
        _archiveModel.InspectDate = @"2018-12-09 10:40";
        _archiveModel.YearTimes = @"12";
        _archiveModel.InspectTypeName = @"自检自查";
    }
    return _archiveModel;
}
@end
