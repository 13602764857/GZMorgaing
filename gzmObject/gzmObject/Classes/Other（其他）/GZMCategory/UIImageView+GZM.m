//
//  UIImageView+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/9.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIImageView+GZM.h"

@implementation UIImageView (GZM)
/******* uiimageView的动画  *******/
-(void)GZMstartAnimationWithArr:(NSArray *)imageArr with:(NSTimeInterval)interval{
    NSMutableArray * Marr = [NSMutableArray array];
    
    for (id obj in imageArr) {
        [Marr addObject:[UIImage imageNamed:obj]];
    }
    self.animationImages = Marr;
    self.animationDuration = interval;
    self.animationRepeatCount = 0;
    [self startAnimating];
}

@end
