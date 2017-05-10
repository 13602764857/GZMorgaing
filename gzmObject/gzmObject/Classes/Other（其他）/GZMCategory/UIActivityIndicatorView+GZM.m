//
//  UIActivityIndicatorView+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/13.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UIActivityIndicatorView+GZM.h"

@implementation UIActivityIndicatorView (GZM)
/******* <#name#>  *******/
-(void)GZMSetACtiviStyle{
    [self startAnimating];
    
    [self setHidesWhenStopped:YES]; //当旋转结束时隐藏
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    CGAffineTransform transform = CGAffineTransformMakeScale(2, 2);
    self.transform = transform;
}

@end
