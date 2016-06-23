//
//  View4.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View4.h"

@implementation View4

- (void)drawRect:(CGRect)rect {
    
    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 40.0f) textToDisplay:@"Miter"
                         lineJoin:kCGLineJoinMiter];
    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 180.0f) textToDisplay:@"Bevel"
                         lineJoin:kCGLineJoinBevel];
    [self drawRooftopAtTopPointof:CGPointMake(160.0f, 320.0f) textToDisplay:@"Round"
                         lineJoin:kCGLineJoinRound];
}

- (void) drawRooftopAtTopPointof:(CGPoint)paramTopPoint textToDisplay:(NSString *)paramText lineJoin:(CGLineJoin)paramLineJoin {
    
    [[UIColor brownColor] set];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSetLineJoin(currentContext, paramLineJoin);
    CGContextSetLineWidth(currentContext, 20.0f);
    CGContextMoveToPoint(currentContext, paramTopPoint.x - 140, paramTopPoint.y + 100);
    CGContextAddLineToPoint(currentContext,paramTopPoint.x, paramTopPoint.y);
    CGContextAddLineToPoint(currentContext,paramTopPoint.x + 140,paramTopPoint.y + 100);
    CGContextStrokePath(currentContext);
    
    
    [[UIColor blackColor] set];
    [paramText drawAtPoint:CGPointMake(paramTopPoint.x - 40.0f, paramTopPoint.y + 60.0f) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],NSForegroundColorAttributeName:[UIColor blueColor]}];
}
@end
