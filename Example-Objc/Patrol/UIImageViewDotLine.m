//
//  UIImageView+DotLine.m
//  FSCalendarExample
//
//  Created by admin on 2018/7/18.
//  Copyright © 2018年 wenchaoios. All rights reserved.
//

#import "UIImageViewDotLine.h"

@implementation UIImageViewDotLine

-(void)awakeFromNib
{
    [super awakeFromNib];
    if (self.lineColor) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        UIGraphicsBeginImageContext(self.frame.size);
        [self.image drawInRect:CGRectMake(0, 0, width, height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGFloat lengths[] = {3,4};
        CGContextRef line = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(line, self.lineColor.CGColor);
        CGContextSetLineDash(line, 0, lengths, 1);
        CGContextSetLineWidth(line, 2);
        CGContextMoveToPoint(line, 0, 1);
        CGContextAddLineToPoint(line, 1, height);
        CGContextStrokePath(line);
        self.image = UIGraphicsGetImageFromCurrentImageContext();
    }
}

@end
