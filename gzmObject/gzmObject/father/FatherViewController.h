//
//  FatherViewController.h
//  GzAgent
//
//  Created by gzm on 15/12/17.
//  Copyright © 2015年 gzcentaline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "withTableviewViewController.h"
@interface FatherViewController :withTableviewViewController
/********** ************/
@property(nonatomic,strong)UIButton * leftbutton1;

@property(nonatomic,strong)UIButton * rightbutton1;

@property(nonatomic,strong)UILabel * mainlable1;

@property(nonatomic,strong)UIImageView * imageView1;

-(void)leftbutton1Click;

-(void)rightbutton1Click;


-(void)creatFather;
-(void)creatUI;
-(void)creatData;

@end
