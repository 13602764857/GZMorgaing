//
//  UIImage+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/27.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIImage+GZM.h"

@implementation UIImage (GZM)
/******* 在小图片上增加小图片  *******/
-(UIImage *)GZMaddImage:(UIImage *)image1
{
    UIGraphicsBeginImageContext(self.size);
    
    //Draw image2
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGFloat  wWith = self.size.width * (2/3.0);
    CGFloat Hheigh = self.size.height * (2/3.0);
    //Draw image1
    [image1 drawInRect:CGRectMake(1/6.0 * self.size.width, 1/6.0 * self.size.height, wWith, Hheigh)];
    
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    NSLog(@"%f  %f",self.size.width,self.size.height);
    
    NSLog(@"%f  %f",wWith,Hheigh);
    return resultImage;
}
/******* 将图片等宽的压缩裁剪  *******/
-(UIImage *)GZMChangeImage{
     UIGraphicsBeginImageContext(CGSizeMake(self.size.width, self.size.width));
    //Draw image2
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    UIImage *resultImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultImage;
}
/******* 将图片按要求裁剪  *******/
- (UIImage *)GZMgetPartrect:(CGRect)partRect
{
    CGImageRef imageRef = self.CGImage;
    // partRect是裁剪的区域
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
    UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return retImg;
}
/******* 将图片圆角处理不耗性能  *******/
-(UIImage *)GZMcircleImage{
    //1.开启图片图形上下文:注意设置透明度为非透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //2.开启图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //3.绘制圆形区域(此处根据宽度来设置)
    //获取短的一边
    CGFloat  circleWidth = self.size.width > self.size.height ? self.size.height : self.size.width;
    CGRect rect = CGRectMake(0, 0, circleWidth, circleWidth);
    CGContextAddEllipseInRect(ref, rect);
    //4.裁剪绘图区域
    CGContextClip(ref);
    
    //5.绘制图片
    [self drawInRect:rect];
    
    //6.获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //7.关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
