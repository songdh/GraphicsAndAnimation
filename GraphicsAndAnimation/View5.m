//
//  View5.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View5.h"

@implementation View5

- (void)drawRect:(CGRect)rect{ // Drawing code
    
    //画圆角矩形
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 120.0f);
    CGPathMoveToPoint(path, NULL, 10, 10);
    CGPathAddRoundedRect(path, NULL, rectangle, 60, 60);
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 5.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path);
    
//        画交叉线
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL,0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    CGPathMoveToPoint(path, NULL,CGRectGetWidth(self.bounds), 0);
    CGPathAddLineToPoint(path, NULL,0, CGRectGetHeight(self.bounds));
    
    
    CGContextAddPath(currentContext, path);
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(currentContext, 1.0f);
    CGContextDrawPath(currentContext, kCGPathStroke);
    
    CGPathRelease(path);
    
    
    //通过矩形数组画多个矩形
    path = CGPathCreateMutable();
    
    CGRect rectangle1 = CGRectMake(240, 10.0f, 80, 300.0f);
    
    CGRect rectangle2 = CGRectMake(250, 100.0f, 60, 300.0f);
    
    CGRect rectangles[2] = {rectangle1, rectangle2};
    
    CGPathAddRects(path, NULL, (const CGRect *)&rectangles, sizeof(rectangles)/sizeof(CGRect));
    
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor blackColor] setStroke];
    CGContextSetLineWidth(currentContext, 2.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path);
}

@end
