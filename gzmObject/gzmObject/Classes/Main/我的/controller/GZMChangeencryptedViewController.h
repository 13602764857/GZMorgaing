//
//  GZMChangeencryptedViewController.h
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "FatherViewController.h"

@interface GZMChangeencryptedViewController : FatherViewController
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet UITextField *oneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *twoTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *threeTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
/**********<#属性#> ************/
@property (weak, nonatomic) IBOutlet UIView *BackView;
@property(nonatomic,strong)NSString * encryptToken;
/**********<#属性#> ************/
@property(nonatomic,copy)NSString * onlytoken;
@end
