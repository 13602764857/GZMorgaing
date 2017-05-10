//
//  UIView+SYFrame.m
//  Created by 碎月 on 16/2/19.
//  Copyright © 2016年 碎月. All rights reserved.
//

#import "UIView+SYFrame.h"

@implementation UIView (SYFrame)

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

#pragma mark - 获取屏幕朝向
- (BOOL)getIslandscace{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    BOOL islandscace;
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            islandscace = NO; ;
            break;
            
        case UIInterfaceOrientationPortraitUpsideDown:
            islandscace = NO;
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
            islandscace = YES;
            break;
            
        case UIInterfaceOrientationLandscapeRight:
            islandscace = YES;
            break;
        default:
            islandscace = NO;
            break;
    }
    return islandscace;
}
/******* 给控件画圆角  *******/
-(void)GZMcircleView{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.frame.size.width] addClip];
    [self drawRect:self.bounds];
    
    //    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
}

/******* 适配系数  *******/
-(void)sizeToFitFrame{
    self.width = self.width *FITNUM;
    self.height = self.height *FITNUM;
    self.x = self.x *FITNUM;
    self.y = self.y * FITNUM;
}
/******* 让其控件有圆角且圆角有颜色  *******/
-(void)GZMchangeStyleWith:(CGFloat)size withborad:(CGFloat)borcdSize withBoardColor:(UIColor *)color{
    self.layer.cornerRadius = size;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borcdSize;
    self.layer.borderColor = (__bridge CGColorRef _Nullable)(color);
}



@end
