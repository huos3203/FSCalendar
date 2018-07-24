//
//  InsReportModel.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/24.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "InsReportModel.h"
#import "ReformSignModel.h"
#import "InsOptModel.h"

@implementation InsReportModel
-(instancetype)initWithDemo
{
    if (self = [super init]) {
        self.StoreId = @"jshdfjs";
        self.StoreName = @"庆丰包子铺清河站";
        self.StoreTypeName = @"大型商场店面";
        self.InspectDate = @"2014-09-12";
        self.InspectTypeName = @"自检自查";
        self.YearTimes = @"23";
        self.Remark = @"签名备注信息";
        self.Signature = @"sdfsdfsdfsfsfsfs";
    }
    return self;
}
-(NSString *)YearTimes{
    if ([_YearTimes hasPrefix:@"本"]) {
        _YearTimes = [NSString stringWithFormat:@"本年度第%@次检查",_YearTimes];
    }
    return _YearTimes;
}
-(NSArray<InsOptModel *> *)InsOpts
{
    if (!_InsOpts) {
        NSMutableArray *arr = [NSMutableArray new];
        InsOptModel *model = [InsOptModel new];
        model.Id = @"dfdfdf";
        model.Pics = @"sdfdfd";
        model.Text = @"中华小子";
        model.Signature = @"qianzi ";
        model.Remark = @"备注说明问题";
        InsOptModel *model1 = [InsOptModel new];
        model1.Id = @"dfdfdf";
        model1.Pics = @"sdfdfd";
        model1.Text = @"中华小子";
        model1.Signature = @"qianzi ";
        model1.Remark = @"备注说明问题";
        InsOptModel *model2 = [InsOptModel new];
        model2.Id = @"dfdfdf";
        model2.Pics = @"sdfdfd";
        model2.Text = @"中华小子";
        model2.Signature = @"qianzi ";
        model2.Remark = @"备注说明问题";
        InsOptModel *model3 = [InsOptModel new];
        model3.Id = @"dfdfdf";
        model3.Pics = @"sdfdfd";
        model3.Text = @"中华小子";
        model3.Signature = @"qianzi ";
        model3.Remark = @"备注说明问题";
        [arr addObjectsFromArray:@[model,model1,model2,model3]];
        _InsOpts = [arr copy];
    }
    return _InsOpts;
}
-(NSArray<ReformSignModel *> *)ReformSignature
{
    if (!_ReformSignature) {
//        _ReformSignature
        NSMutableArray *arr = [NSMutableArray new];
        ReformSignModel *model = [ReformSignModel new];
        model.Remark = @"nihaohh";
        model.RoleName = @"张三";
        model.Signature = @"https";
        ReformSignModel *model1 = [ReformSignModel new];
        model1.Remark = @"nihaohh";
        model1.RoleName = @"张三";
        model1.Signature = @"https";
        ReformSignModel *model2 = [ReformSignModel new];
        model2.Remark = @"nihaohh";
        model2.RoleName = @"张三";
        model2.Signature = @"https";
        ReformSignModel *model3 = [ReformSignModel new];
        model3.Remark = @"nihaohh";
        model3.RoleName = @"张三";
        model3.Signature = @"https";
        [arr addObjectsFromArray:@[model,model1,model2,model3]];
        _ReformSignature = [arr copy];
    }
    return _ReformSignature;
}
@end
