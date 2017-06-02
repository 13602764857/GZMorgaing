//
//  GZMForgetViewController.h
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "FatherViewController.h"

@interface GZMForgetViewController : FatherViewController
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet UITextField *oneTextfiled;
@property (weak, nonatomic) IBOutlet UITextField *twoTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *threeTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
/**********<#属性#> ************/
@property(nonatomic,copy)NSString * username;
@end
