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
    
    return [UIColor GZMcolorWithHexString:@"#f0f0f0"];
}

/******* 文字的色系  *******/
+(UIColor *)GZMTitleColor
{
    
    return [UIColor GZMcolorWithHexString:@"#cecece"];
}
/******* 主色系的色系  *******/
+(UIColor *)GZMMainColor
{
    
    return [UIColor GZMcolorWithHexString:@"#1592ff" withalpha:0.95];
}

/********** 颜色转换************/
+ (UIColor *) GZMcolorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
/********** (带有透明度)颜色转换************/
+ (UIColor *) GZMcolorWithHexString: (NSString *)color withalpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

@end
