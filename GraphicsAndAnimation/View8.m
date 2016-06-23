//
//  View8.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View8.h"
#define CTM
@implementation View8


//CGAffineTransformMakeRotation旋转   CGContextRotateCTM
//CGAffineTransformMakeScale缩放  CGContextScaleCTM
//CGAffineTransformMakeTranslation平移   CGContextTranslateCTM

- (void)drawRect:(CGRect)rect{ // Drawing code
    
#ifndef CTM
    //CGAffineTransform 类型的变化,将图形从一个位置平移到另一个位置
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100.0f, 0.0f);
    CGPathAddRect(path, &transform, rectangle);
    /* Get the handle to the current context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor brownColor] setStroke];
    CGContextSetLineWidth(currentContext, 5.0f);
    
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    /* Dispose of the path */
    CGPathRelease(path);
    
#else
    //CTM变化
    /*对图形上下文进行变换，即把一个平移变换应用到当前变换矩阵(CTM current transformation matrix)。把CTM认为是它设置了你的图形上下文的中心，是它把你绘制的每个点投射到屏幕上。例如,当你要求CoreGraphics在（0，0）处绘制一个点，CoreGraphics通过查找CTM来寻找屏幕的中心。CTM将做一些计算，并告诉CoreGraphics点（0，0）是在屏幕的左上角。使用过程如CGContextTranslateCTM，你可以改变CTM的配置，随后强制所有绘制在图形上下文的形状转移到画布上的另一个地方。
     */
    
    CGMutablePathRef path = CGPathCreateMutable();
    /* Here are our rectangle boundaries */
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
    CGPathAddRect(path, NULL, rectangle);
    /* Get the handle to the current context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    /* Save the state of the context to revert back to how it was at this state, later */
    CGContextSaveGState(currentContext);
    /* Translate the current transformation matrix to the right by 100 points */
    CGContextTranslateCTM(currentContext, 100.0f, 0.0f); /* Add the path to the context */
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor brownColor] setStroke];
    CGContextSetLineWidth(currentContext, 5.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
    CGContextRestoreGState(currentContext);
#endif
}

@end
