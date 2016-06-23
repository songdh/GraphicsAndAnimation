//
//  View2.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "View2.h"

@implementation View2

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor randomColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 10, 100, 35);
        [button setTitle:@"颜色分量" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blueColor];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        
        [self getComponents];
    }
    return self;
}


-(void)onClick:(id)sender
{
    self.backgroundColor = [UIColor randomColor];
    
    [self getComponents];
}

-(void)getComponents
{
    CGColorRef colorRef = self.backgroundColor.CGColor;
    
    const CGFloat *components = CGColorGetComponents(colorRef);
    NSUInteger componentsCount = CGColorGetNumberOfComponents(colorRef);
    
    NSString *string = @"";
    string = [string stringByAppendingFormat:@"red:%.02f\n",components[0]];
    string = [string stringByAppendingFormat:@"green:%.02f\n",components[1]];
    string = [string stringByAppendingFormat:@"blue:%.02f\n",components[2]];
    if (componentsCount >= 4) {
        string = [string stringByAppendingFormat:@"alpha:%.02f",components[3]];
    }
    
    UILabel *label = (UILabel*)[self viewWithTag:30000];
    if (!label) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 100, 100)];
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
    }

    label.text = string;
    [self addSubview:label];
}

@end
