//
//  UIColor+Extension.h
//  schoollife
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import <UIKit/UIKit.h>

#undef	__RGBCOLOR
#define __RGBCOLOR(R,G,B)		[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef	__RGBACOLOR
#define __RGBACOLOR(R,G,B,A)	[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#undef	__HEX_RGBACOLOR
#define __HEX_RGBACOLOR(V, A)	[UIColor fromHexValue:V alpha:A]

@interface UIColor (Extension)

+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;
//若color包含alpha值，则参数alpha无效
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
