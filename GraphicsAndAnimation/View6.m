//
//  View6.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View6.h"

@implementation View6

- (void)drawRectAtTopOfScreen {
    
    //可以通过CGContextSaveGState过程保存图形上下文的状态，通过CGContextRestoreGState恢复到以前的状态.恢复图形上下文的状态会恢复一切，包括填充颜色、字体、线条粗细等
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    保存上下文状态
//    CGContextSaveGState(currentContext);
    
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect firstRect = CGRectMake(55.0f, 60.0f, 150.0f, 150.0f);
    CGPathAddRect(path, NULL, firstRect);
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    CGContextDrawPath(currentContext, kCGPathFill);
    
    CGPathRelease(path);
    
//    恢复上下文状态
//    CGContextRestoreGState(currentContext);
}


- (void)drawRectAtBottomOfScreen {
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGMutablePathRef secondPath = CGPathCreateMutable();
    CGRect secondRect = CGRectMake(150.0f, 320, 100.0f, 100.0f);
    CGPathAddRect(secondPath, NULL, secondRect);
    CGContextAddPath(currentContext, secondPath);
    [[UIColor purpleColor] setFill];
    CGContextDrawPath(currentContext, kCGPathFill);
    CGPathRelease(secondPath);
}

- (void)drawRect:(CGRect)rect { // Drawing code
    [self drawRectAtTopOfScreen];
    
    NSString *string = @"绘制第二个矩形，我们不会显示设置阴影，但第一个矩形设置的阴影已经保留在上下文当中了.查看代码，放开注释代码，可以恢复上下文状态";
    [string drawInRect:CGRectMake(10, 260, 280, 80) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    [self drawRectAtBottomOfScreen];
}

@end
