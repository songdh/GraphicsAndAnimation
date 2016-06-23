//
//  ViewController5.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()
@property (nonatomic, strong) UIImageView *imageView1;
@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"image"];
    
    _imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-40-20, screenHeight-64-60, 40, 40)];
    _imageView1.image = image;
    [self.view addSubview:_imageView1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.imageView1.transform = CGAffineTransformIdentity;
    /* Begin the animation */
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5.0f];
    self.imageView1.transform = CGAffineTransformMakeScale(4.0f, 4.0f);
    /* Commit the animation */
    [UIView commitAnimations];
    
    
    
    
    [UIView beginAnimations:@"xcodeImageView1Animation" context:(__bridge void * _Nullable)(self.imageView1)];
    /* 3 seconds animation */
    [UIView setAnimationDuration:3.0f];
    /* End at the bottom right corner */
    [self.imageView1 setCenter:CGPointMake(90,90)];
    [UIView commitAnimations];
    
}

@end
