//
//  UIColor+GZM.h
//  AgentTool
//
//  Created by gzm on 17/3/13.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GZM)
/******* 比灰色暗一点的色系  *******/
+(UIColor *)GZMLightColor;
/******* color的色素  *******/
+ (UIColor *)GZMcolorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue Withalpha:(CGFloat)alpha;
+ (UIColor *)GZMcolorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
/********** 颜色转换************/
+ (UIColor *) GZMcolorWithHexString: (NSString *)color;

/******* 文字的色系  *******/
+(UIColor *)GZMTitleColor;
/******* 主色系的色系  *******/
+(UIColor *)GZMMainColor;
/********** (带有透明度)颜色转换************/
+ (UIColor *) GZMcolorWithHexString: (NSString *)color withalpha:(CGFloat)alpha;
@end
