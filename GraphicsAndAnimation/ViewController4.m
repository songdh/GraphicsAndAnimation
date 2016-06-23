//
//  ViewController4.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"image"];
    
    _imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _imageView1.image = image;
    [self.view addSubview:_imageView1];
    
    _imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth-40, screenHeight-64-40, 40, 40)];
    _imageView2.image = image;
    [self.view addSubview:_imageView2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self startTopLeftImageViewAnimation];
    [self startBottomRightViewAnimationAfterDelay:1.0f];
}

- (void) startTopLeftImageViewAnimation{
    
    [self.imageView1 setAlpha:1.0f];
    [UIView beginAnimations:@"xcodeImageView1Animation" context:(__bridge void * _Nullable)(self.imageView1)];
    /* 3 seconds animation */
    [UIView setAnimationDuration:4.0f];
    /* Receive animation delegates */ [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(imageViewDidStop:finished:context:)];
    /* End at the bottom right corner */
    [self.imageView1 setCenter:CGPointMake(screenWidth-CGRectGetWidth(_imageView1.frame)/2, screenHeight-CGRectGetHeight(_imageView1.frame)/2-64)];
    [self.imageView1 setAlpha:0];
    [UIView commitAnimations];
}

- (void)imageViewDidStop:(NSString *) paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext
{
    NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", paramAnimationID);
    UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
    NSLog(@"Image View = %@", contextImageView);
}



- (void) startBottomRightViewAnimationAfterDelay: (CGFloat)paramDelay {
    
    [self.imageView2 setAlpha:1.0f];
    [UIView beginAnimations:@"xcodeImageView2Animation" context:(__bridge void * _Nullable)(self.imageView2)];
    
    /* 3 seconds animation */
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelay:paramDelay];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector: @selector(imageViewDidStop:finished:context:)];
    [self.imageView2 setCenter:CGPointMake(CGRectGetWidth(self.imageView2.frame)/2, CGRectGetHeight(self.imageView2.frame)/2)];
    [self.imageView2 setAlpha:0.0f];
    [UIView commitAnimations];
}


@end
