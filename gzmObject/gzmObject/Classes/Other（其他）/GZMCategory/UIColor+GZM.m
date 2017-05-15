//
//  UIColor+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/13.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIColor+GZM.h"

@implementation UIColor (GZM)
/******* color的色素  *******/
+ (UIColor *)GZMcolorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue Withalpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red /255.0 green:green /255.0 blue:blue / 255.0 alpha:alpha];
}
+ (UIColor *)GZMcolorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [UIColor colorWithRed:red /255.0 green:green /255.0 blue:blue / 255.0 alpha:1];
}

/******* 比灰色暗一点的色系  *******/
+(UIColor *)GZMLightColor
{
    
    return [UIColor colorWithRed:86 /255.0 green:86 /255.0 blue:86 / 255.0 alpha:1];
}


@end
