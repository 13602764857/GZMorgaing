//
//  GZMAlertView.m
//  AgentTool
//
//  Created by gzm on 17/3/17.
//  Copyright © 2017年 test. All rights reserved.
//

#import "GZMAlertView.h"

@implementation GZMAlertView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatView];
    }
    return self;
}

-(void)creatView{
    self.backgroundColor = [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0 alpha:0.5];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self addGestureRecognizer:tap];
    
    
    
}
-(void)tapClick{
    [self removeFromSuperview];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
