//
//  view1.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View1.h"

@implementation View1

- (void)drawRect:(CGRect)rect{ // Drawing code
    
    //drawAtPoint
    NSString *string1 = @"drawAtPoint:";
    [string1 drawAtPoint:CGPointMake(10, 20) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    NSString *string = @"有志者事竟成 Yes I do";
    [string drawAtPoint:CGPointMake(10, 40) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor greenColor]}];
    
    
    //drawInRect
    string1 = @"drawInRect:";
    [string1 drawAtPoint:CGPointMake(10, 70) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    [string drawInRect:CGRectMake(10, 90, 90, 100) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
}

@end
