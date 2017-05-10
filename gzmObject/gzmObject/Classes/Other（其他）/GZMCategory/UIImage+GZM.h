//
//  UIImage+GZM.h
//  AgentTool
//
//  Created by gzm on 17/3/27.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GZM)
/******* 在小图片上增加小图片  *******/
-(UIImage *)GZMaddImage:(UIImage *)image1;

/******* 将图片等宽的压缩裁剪  *******/
-(UIImage *)GZMChangeImage;
/******* 将图片按要求裁剪  *******/
- (UIImage *)GZMgetPartrect:(CGRect)partRect;
/******* 将图片圆角处理不耗性能  *******/
-(UIImage *)GZMcircleImage;

@end
