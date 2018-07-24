//
//  InsOptModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/24.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CameraModel;
@interface InsOptModel : NSObject
@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) NSString *Pics;
@property (strong, nonatomic) NSString *Text;
@property (strong, nonatomic) NSString *Signature;
@property (strong, nonatomic) NSString *Remark;
@property (strong, nonatomic) NSArray<CameraModel *> *picsArr;
@end
