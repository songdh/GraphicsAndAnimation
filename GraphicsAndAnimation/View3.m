//
//  View2.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View3.h"

@implementation View3

-(void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"image"];

    [image drawInRect:CGRectMake(10, 10, 50, 50)];
    
    [image drawAtPoint:CGPointMake(10, 110)];
    
    
}

@end
