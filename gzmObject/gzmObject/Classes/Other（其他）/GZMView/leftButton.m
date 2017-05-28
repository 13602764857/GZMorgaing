//
//  leftButton.m
//  AgentTool
//
//  Created by gzm on 16/12/16.
//  Copyright © 2016年 test. All rights reserved.
//

#import "leftButton.h"

@implementation leftButton


-(void)layoutSubviews
{
    [super layoutSubviews];
     //设置lable
    self.titleLabel.centerX = self.width * 3 / 4.0/2 +5;
    self.titleLabel.centerY = self.height / 2;
    self.titleLabel.textColor = [UIColor blackColor];
    
    //设置图片
    self.imageView.centerY = self.height/2;
    self.imageView.centerX = self.width*3/4 + self.width/4/2 - 5;
   
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
   
   
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
