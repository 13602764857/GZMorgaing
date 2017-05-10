//
//  UIView+GZM.h
//  AgentTool
//
//  Created by gzm on 17/3/9.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#define FITNUM ([UIScreen mainScreen].bounds.size.width/375)   //适配比例系数

@interface UIView (GZM)
/**
 *  用点语法快速获取 宽 高 X Y;
 */
@property CGFloat widthG;

@property CGFloat heightG;

@property CGFloat xG;

@property CGFloat yG;

@property CGFloat centerXG;

@property CGFloat centerYG;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGSize size;
/******* 给控件画圆角  *******/
-(void)GZMcircleView;
- (BOOL)getIslandscace;
/******* 适配屏幕尺寸系数  *******/
-(void)sizeToFitFrame;
/******* 让其控件有圆角且圆角有颜色  *******/
-(void)GZMchangeStyleWith:(CGFloat)size withborad:(CGFloat)borcdSize withBoardColor:(UIColor *)color;

@end
