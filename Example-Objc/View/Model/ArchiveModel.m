//
//  ArchiveModel.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "ArchiveModel.h"
#import "objc/runtime.h"

@implementation ArchiveModel



-(void)arhive
{
    NSString *archivePath = [ArchiveModel pathOf:NSStringFromClass([self class])];
    //将数据归档到path文件路径里面
    BOOL success = [NSKeyedArchiver archiveRootObject:self toFile:archivePath];
    if (success) {
        NSLog(@"归档成功");
    }else {
        NSLog(@"归档失败");
    }
}

+(ArchiveModel *)unArhive:(Class)className
{
    ArchiveModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:[ArchiveModel pathOf:NSStringFromClass(className)]];
    return model;
}
//自动归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    // 获取类的所有成员变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        // 取得i位置的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

//解档
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        // 获取类的所有成员变量
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        
        for (int i = 0; i < count; i++) {
            // 取得i位置的成员变量
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

#pragma mark setter/getter
+(NSString *)pathOf:(NSString *)file
{
    //沙盒ducument目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //完整的文件路径
    NSString *fileName = [NSString stringWithFormat:@"%@.archive",file];
    NSString *path = [docPath stringByAppendingPathComponent:fileName];
    return path;
}
@end
