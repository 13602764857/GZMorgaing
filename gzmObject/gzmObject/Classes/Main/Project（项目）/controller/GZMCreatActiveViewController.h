//
//  GZMCreatActiveViewController.h
//  gzmObject
//
//  Created by gzm on 2017/5/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FatherViewController.h"
#import "GZMProjectModel.h"
@interface GZMCreatActiveViewController : FatherViewController
/**********<#属性#> ************/
@property(nonatomic,strong)GZMProjectModel * Projectmodel;
@property (weak, nonatomic) IBOutlet UITextField *timeTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *projectTitle;
@property (weak, nonatomic) IBOutlet UITextField *numTextFiled;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet UIButton *activeButton;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
