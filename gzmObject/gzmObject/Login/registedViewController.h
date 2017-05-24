//
//  registedViewController.h
//  gzmObject
//
//  Created by gzm on 2017/5/16.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "FatherViewController.h"

@interface registedViewController : FatherViewController
@property (strong, nonatomic)UIPickerView *myPickerView;
@property (weak, nonatomic) IBOutlet UITextField *usertextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTexield;
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UITextField *twoPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *imageTextfield;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *yanzhengImageView;

@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet UITextField *oneanswertextFiled;
@property (weak, nonatomic) IBOutlet UITextField *TwoanswertextFiled;
@property (weak, nonatomic) IBOutlet UITextField *threeanswertextFiled;

@end
