//
//  ViewController3.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
@property (nonatomic, strong) UIImageView *imageView;
@end

/*
 在你通过beginAnimations:context:方法开始一个动画之后，它实际上不会马上执行二十知道你调用UIView类的commitAnimations类方法。在beginAnimations:context: 和commitAnimations之间，你对一个视图对象的计算（如移动）将在commitAnimations被调用之后开始进行动画
 */

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"image"];
    _imageView = [[UIImageView alloc]init];
    _imageView.image = image;
    _imageView.frame = CGRectMake(10, 10, 40, 40);
    [self.view addSubview:_imageView];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self.imageView setFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    [UIView beginAnimations:@"xcodeImageViewAnimation" context:(__bridge void * _Nullable)(self.imageView)];
    
    [UIView setAnimationDuration:3.0f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(imageViewDidStop:finished:context:)];
    [self.imageView setCenter:CGPointMake(screenWidth-CGRectGetWidth(_imageView.frame)/2,
                                          screenHeight-64-CGRectGetHeight(_imageView.frame)/2)];
    [UIView commitAnimations];
}


- (void)imageViewDidStop:(NSString *) paramAnimationID finished:(NSNumber *)paramFinished context:(void *)paramContext
{
    NSLog(@"Animation finished.");
    NSLog(@"Animation ID = %@", paramAnimationID);
    UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
    NSLog(@"Image View = %@", contextImageView);
}


@end
