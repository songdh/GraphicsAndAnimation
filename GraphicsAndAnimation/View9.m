//
//  View9.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View9.h"

@implementation View9


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //画椭圆
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 120.0f);
    CGPathMoveToPoint(path, NULL, 10, 10);
    CGPathAddEllipseInRect(path, NULL, rectangle);
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 5.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    
    CGPathRelease(path);
    
    
    //画弧线,添加一个二次曲线 a quadratic curve
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 140);
    CGPathAddQuadCurveToPoint(path, NULL, 1, 220, 50, 300);
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 1.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
    
    
    
    //画三次Bezier曲线  cubic Bézier curve
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,100,140);
    CGPathAddCurveToPoint(path,NULL,100,300,
                          240,300,
                          240,140);
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 3.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
    
    
    //画圆
    /* Add an arc of a circle to `path', possibly preceded by a straight line
     segment. The arc is approximated by a sequence of Bézier curves. The
     center of the arc is `(x,y)'; `radius' is its radius. `startAngle' is the
     angle to the first endpoint of the arc, measured counter-clockwise from
     the positive x-axis. `startAngle + delta' is the angle to the second
     endpoint of the arc. If `delta' is positive, then the arc is drawn
     counter-clockwise; if negative, clockwise. `startAngle' and `delta' are
     measured in radians. If `matrix' is non-NULL, then the constructed Bézier
     curves representing the arc will be transformed by `matrix' before they
     are added to the path. */
    
    path = CGPathCreateMutable();
    CGPathAddRelativeArc(path, NULL, 70, 360, 60, 0, 1.8*M_PI);
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 3.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
    
    
    
    //画圆
    /* Add an arc of a circle to `path', possibly preceded by a straight line
     segment. The arc is approximated by a sequence of Bézier curves. `(x, y)'
     is the center of the arc; `radius' is its radius; `startAngle' is the
     angle to the first endpoint of the arc; `endAngle' is the angle to the
     second endpoint of the arc; and `clockwise' is true if the arc is to be
     drawn clockwise, false otherwise. `startAngle' and `endAngle' are
     measured in radians. If `m' is non-NULL, then the constructed Bézier
     curves representing the arc will be transformed by `m' before they are
     added to `path'.
     
     Note that using values very near 2π can be problematic. For example,
     setting `startAngle' to 0, `endAngle' to 2π, and `clockwise' to true will
     draw nothing. (It's easy to see this by considering, instead of 0 and 2π,
     the values ε and 2π - ε, where ε is very small.) Due to round-off error,
     however, it's possible that passing the value `2 * M_PI' to approximate
     2π will numerically equal to 2π + δ, for some small δ; this will cause a
     full circle to be drawn.
     
     If you want a full circle to be drawn clockwise, you should set
     `startAngle' to 2π, `endAngle' to 0, and `clockwise' to true. This avoids
     the instability problems discussed above. */
    
    path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 210, 360, 60, 0, 2*M_PI, YES);
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 3.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
    
    
    
    /* Add an arc of a circle to `path', possibly preceded by a straight line
     segment. The arc is approximated by a sequence of Bézier curves. `radius'
     is the radius of the arc. The resulting arc is tangent to the line from
     the current point of `path' to `(x1, y1)', and the line from `(x1, y1)'
     to `(x2, y2)'. If `m' is non-NULL, then the constructed Bézier curves
     representing the arc will be transformed by `m' before they are added to
     `path'. */
    //画一段圆弧
    path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 60, 430);
    //右上角和右下角两个点，画出半个圆角
    CGPathAddArcToPoint(path, NULL, 150, 430, 150, 500, 30);
    //右下角和左下角两个点，画出另外半个圆角
    CGPathAddArcToPoint(path, NULL, 150, 500, 30, 500, 30);
    
    CGPathAddArcToPoint(path, NULL, 30, 500, 30, 430, 30);
    
    CGPathAddArcToPoint(path, NULL, 30, 430, 150, 430, 30);
    
    
    CGContextAddPath(currentContext, path);
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    [[UIColor purpleColor] setStroke];
    CGContextSetLineWidth(currentContext, 3.0f);
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
    
}

@end
