//
//  UIView+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/9.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIView+GZM.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation UIView (GZM)

-(void)setWidthG:(CGFloat)widthG
{
    CGRect frame = self.frame;
    if (frame.size.height == Width) {
        frame.size.width = widthG;
    }else{
        frame.size.width = widthG*FITNUM;
    }

    frame.size.width = widthG *FITNUM;
    self.frame = frame;
}

-(CGFloat)widthG
{
    return self.frame.size.width;
}

-(void)setHeightG:(CGFloat)heightG
{
    CGRect frame = self.frame;
    if (frame.size.height == Height) {
        frame.size.height = heightG;
    }else{
        frame.size.height = heightG*FITNUM;
    }
    
    self.frame = frame;
}

-(CGFloat)heightG
{
    return self.frame.size.height;
}

-(void)setXG:(CGFloat)xG
{
    CGRect frame = self.frame;
    frame.origin.x = xG*FITNUM;
    self.frame = frame;
}

-(CGFloat)xG
{
    return self.frame.origin.x;
}

-(void)setYG:(CGFloat)yG
{
    CGRect frame = self.frame;
    frame.origin.y = yG*FITNUM;
    self.frame = frame;
}

-(CGFloat)yG
{
    return self.frame.origin.y;
}

- (void)setCenterXG:(CGFloat)centerXG
{
    CGPoint center = self.center;
    center.x = centerXG*FITNUM;
    self.center = center;
}
- (CGFloat)centerXG
{
    return self.center.x;
}
- (void)setCenterYG:(CGFloat)centerYG
{
    CGPoint center = self.center;
    center.y = centerYG*FITNUM;
    self.center = center;
}

- (CGFloat)centerYG
{
    return self.center.y;
}


- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    if (frame.size.height == Height) {
        size.height = size.height ;
    }else{
        size.height = size.height * FITNUM;
    }
    if (frame.size.height == Width) {
        size.width = size.width;
    }else{
        size.width = size.width * FITNUM;
    }

    
    
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    origin.x = origin.x * FITNUM;
    origin.y = origin.y * FITNUM;
    frame.origin = origin;
    self.frame = frame;
}

-(CGPoint)origin{
    return self.frame.origin;
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
