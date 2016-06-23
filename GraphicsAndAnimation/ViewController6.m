//
//  ViewController6.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()
@property (nonatomic, strong) UIImageView *imageView1;
@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *image = [UIImage imageNamed:@"image"];
    
    _imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _imageView1.center = self.view.center;
    _imageView1.image = image;
    [self.view addSubview:_imageView1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    /* Begin the animation */
    [UIView beginAnimations:@"clockwiseAnimation" context:NULL];
    [UIView setAnimationDuration:3.0f];
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(clockwiseRotationStopped:finished:context:)];
    self.imageView1.transform = CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
    /* Commit the animation */
    [UIView commitAnimations];
}

- (void)clockwiseRotationStopped:(NSString *)paramAnimationID finished:(NSNumber *)paramFinished
                         context:(void *)paramContext {
    [UIView beginAnimations:@"counterclockwiseAnimation" context:NULL];
    /* 5 seconds long */
    [UIView setAnimationDuration:3.0f];
    self.imageView1.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

@end
