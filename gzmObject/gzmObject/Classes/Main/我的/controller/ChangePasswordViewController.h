//
//  ChangePasswordViewController.h
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "FatherViewController.h"

@interface ChangePasswordViewController : FatherViewController
@property (weak, nonatomic) IBOutlet UITextField *oneTextfile;
@property (weak, nonatomic) IBOutlet UITextField *twoTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *threeTextFiled;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneViewHeight;
@property(nonatomic,strong)NSString * encryptToken;
/**********<#属性#> ************/
@property(nonatomic,copy)NSString * onlytoken;
@end
