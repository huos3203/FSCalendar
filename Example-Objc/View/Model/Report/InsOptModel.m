//
//  InsOptModel.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/24.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "InsOptModel.h"
#import "CameraModel.h"

@implementation InsOptModel

-(NSArray<CameraModel *> *)picsArr{
    if (!_picsArr) {
        NSArray *picss = [_Pics componentsSeparatedByString:@";"];
        NSMutableArray *arr = [NSMutableArray new];
        for (NSString *pic in picss) {
            CameraModel *item = [CameraModel new];
            item.image = [UIImage imageNamed:@"camera"];
            item.url = pic;
            item.hideDel = NO;
            [arr addObject:item];
        }
        _picsArr = [arr copy];
    }
    return _picsArr;
}
@end
