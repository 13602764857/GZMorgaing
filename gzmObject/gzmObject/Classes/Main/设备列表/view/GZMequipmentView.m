//
//  GZMequipmentView.m
//  gzmObject
//
//  Created by gzm on 2017/6/14.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMequipmentView.h"

@implementation GZMequipmentView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
         self.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.4];
        [self creatView];
    }
    return self;
}

-(void)creatView{
    UIView * backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.center = CGPointMake(self.width/2, self.height/2);
    backView.bounds = CGRectMake(0, 0, Width - 80, 200);
    [self addSubview:backView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
