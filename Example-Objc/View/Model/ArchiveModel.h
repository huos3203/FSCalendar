//
//  ArchiveModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/23.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveModel : NSObject<NSCoding>
-(void)arhive;
+(ArchiveModel *)unArhive:(Class)className;
+(NSString *)pathOf:(NSString *)file;
@end
