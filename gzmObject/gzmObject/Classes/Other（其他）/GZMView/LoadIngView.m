//
//  LoadIngView.m
//  AgentTool
//
//  Created by 康靖原 on 16/12/28.
//  Copyright © 2016年 test. All rights reserved.
//

#import "LoadIngView.h"

@implementation LoadIngView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self creatView1];
        self.backgroundColor = [UIColor clearColor];
     
        
    }
    return self;
}
-(void)creatView1{
    UIActivityIndicatorView *testActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    testActivityIndicator.center = CGPointMake(Width/2 , self.height /2);//只能设置中心，不能设置大小
    [testActivityIndicator startAnimating];
    [self addSubview:testActivityIndicator];
}
-(void)creatView
{
    UIImageView * imageView = [[UIImageView alloc]init];
    
    imageView.center = CGPointMake(Width/2, self.height/2 - 30);
    imageView.bounds = CGRectMake(0, 0,100, 100);

    NSString *listnumer;
    NSMutableArray *arr1 = [NSMutableArray array];
    for (int i = 0; i < 44; i ++) {
        if (i < 10) {
            listnumer = [NSString stringWithFormat:@"0%d",i];
        }else{
            listnumer = [NSString stringWithFormat:@"%d",i];
        }
        NSString *name = [NSString stringWithFormat:@"bee_share_000%@",listnumer];
        UIImage * image = [UIImage imageNamed:name];
        [arr1 addObject:image];
    }
    [self addSubview:imageView];
    imageView.animationImages = arr1;
    imageView.animationDuration = 3;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    
    
}

+(void)hidden
{
    for (UIView *view in KeyWindow.subviews) {
        if ([view isKindOfClass:[LoadIngView class]]) {
            [view removeFromSuperview];
        }
    }
}

+(void)show
{
    LoadIngView *view = [[LoadIngView alloc] initWithFrame:CGRectMake(0, 64, Width, Height - 64)];
    
    [KeyWindow addSubview:view];
}
@end
