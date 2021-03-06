//
//  CheckSelfModel.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "CheckSelfModel.h"
#import "CameraModel.h"

@implementation SelfInspectModel

@end


@implementation CheckSelfModel

-(instancetype)initWithModel:(SelfInspectModel *)model
{
    if (self = [super init]) {
        self.Id = model.Id;
        self.status = NotPassed;
        self.Text = model.Text;
        self.type = model.IsNotForAll?PullType:SwitchType;
        self.IsNeedPic = [NSNumber numberWithBool:model.IsNeedPic];
    }
    return self;
}

-(NSMutableArray<CameraModel *> *)imgArr
{
    if (!_imgArr) {
        _imgArr = [NSMutableArray new];
        CameraModel *item = [CameraModel new];
        item.image = [UIImage imageNamed:@"camera"];
        item.hideDel = NO;
        CameraModel *item2 = [CameraModel new];
        item2.image = [UIImage imageNamed:@"camera"];
        item2.hideDel = YES;
        _imgArr = [NSMutableArray arrayWithObjects:item, item2,nil];
    }
    return _imgArr;
}

-(NSString *)Pictures
{
    if (!_Pictures) {
        NSString *pics = @"";
        for (CameraModel *model in self.imgArr) {
            NSString *picurl = [NSString stringWithFormat:@"%@;",model.url];
            pics = [pics stringByAppendingString:picurl];
        }
        _Pictures = pics;
    }
    return _Pictures;
}
@end

