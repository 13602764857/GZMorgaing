//
//  UIButton+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/9.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIButton+GZM.h"

@implementation UIButton (GZM)
/******* 让button的文字和图片左右  *******/
-(void)GZMLeftBUtton{
    //设置lable
    self.titleLabel.centerX = self.width * 3 / 4.0/2 +5;
    self.titleLabel.centerY = self.height / 2;
    
    
    //设置图片
    self.imageView.centerY = self.height/2;
    self.imageView.centerX = self.width*3/4 + self.width/4/2 - 5;
}
/******* 让button的文字和图片上下  *******/
-(void)GZMTopBUtton{
    self.titleLabel.centerX = self.width/2;
    self.titleLabel.centerY = self.height * 3/4 +self.height*1/4/2 -2;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //设置图片
    self.imageView.centerX = self.width/2;
    self.imageView.centerY = self.height *3/4/2;
        self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

/********** 让button左边文字靠近 右边图片靠************/
-(void)GZMlefiRightButton{
    //设置lable
    self.titleLabel.x = 10;
    
    
    
    //设置图片
    self.imageView.x = self.width - self.imageView.width - 10;
    
}
@end
