//
//  View7.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View7.h"

@implementation View7

- (void)drawRect:(CGRect)rect{
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    //获取色彩空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *startColor = [UIColor blueColor];
    CGFloat *startColorComponents = (CGFloat *)CGColorGetComponents([startColor CGColor]);
    
    UIColor *endColor = [UIColor greenColor];
    CGFloat *endColorComponents = (CGFloat *)CGColorGetComponents([endColor CGColor]);
    
    CGFloat colorComponents[8] = {
        /* Four components of the orange color (RGBA) */
        startColorComponents[0],
        startColorComponents[1],
        startColorComponents[2],
        startColorComponents[3], /* First color = orange */
        /* Four components of the blue color (RGBA) */
        endColorComponents[0],
        endColorComponents[1],
        endColorComponents[2],
        endColorComponents[3], /* Second color = blue */ };
    CGFloat colorIndices[2] = {
        0.0f, /* Color 0 in the colorComponents array */
        1.0f, /* Color 1 in the colorComponents array */ };
    //创建一个渐变的句柄
    //第二个参数 颜色分量：这个数组必须包含红绿蓝和alpha值，数组中元素的数量和接下来的两个参数紧密相关。从本质上讲，你必须让这个数组包含足够的值，用来指定第四个参数中的位置的数量。所以如果你需要两个位置（起点和终点），那么你必须为数组提供两种颜色。每个颜色都由红绿蓝和alpha组成，所以这个数组有2x4项
    //第三个参数 位置数组：颜色数组中各个颜色的位置，此参数控制该渐变从一种颜色过渡到另一种颜色的速度有多快。该数组中元素的数量必须和第四个参数的值相同。假设我们需要两种颜色，我们希望第一种颜色是该渐变的起始颜色、最后一种颜色是该渐变的结束颜色。我们必须提供一个包含了两个CGFloat类型元素的数组，第一项设置为0.0f(与颜色数组中的第一项对应)，第二项设置为1.0f(与颜色数组的第二项对应)。两个中间颜色确保了渐变如何在开始到结束之间插入颜色
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace, (const CGFloat *)&colorComponents,(const CGFloat *)&colorIndices, 2);
    CGColorSpaceRelease(colorSpace);
    
    CGPoint startPoint, endPoint;
    startPoint = CGPointMake(120, 260);
    endPoint = CGPointMake(200.0f, 220);
    
    //当起始坐标和终点坐标纵坐标相同时(或者横坐标相同)，CGContextDrawLinearGradient函数的第四个参数失效
    startPoint = CGPointMake(100, 0);
    endPoint = CGPointMake(100, CGRectGetHeight(self.bounds));
    
    //当option为0的时候，颜色不进行扩展
    CGGradientDrawingOptions options = kCGGradientDrawsBeforeStartLocation|kCGGradientDrawsAfterEndLocation;
//    CGGradientDrawingOptions options = 0;
    CGContextDrawLinearGradient (currentContext, gradient, startPoint, endPoint,options);
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(currentContext);
}


@end
