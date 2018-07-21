//
//  CameraModel.h
//  FSCalendarExample
//
//  Created by admin on 2018/7/21.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CameraModel : NSObject
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) BOOL hideDel;

@end
