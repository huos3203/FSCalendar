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

@interface BaseInfoModel()
@property (strong, nonatomic) NSArray *nameArr;
@end
@implementation BaseInfoModel

-(NSArray<BaseCellModel *> *)infoArr
{
    NSMutableArray *cellArr = [NSMutableArray new];
    NSArray *titleArr = @[@"经营者名称",@"自查类型",@"检查时间",@"业态类型"];
    NSArray *iconArr = @[@"经营者名称",@"自查类型",@"检查次数",@"业态类型"];
    for (int i = 0; i < 4; i++) {
        BaseCellModel *cell = [BaseCellModel new];
        cell.title = titleArr[i];
        cell.icon = iconArr[i];
        cell.name = self.nameArr[i];
        [cellArr addObject:cell];
    }
    return [cellArr copy];
}
-(NSArray *)nameArr
{
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:_storeName];
    [arr addObject:_checkType];
    [arr addObject:_checkDate];
    [arr addObject:_storeType];
    return [arr copy];
}



@end
