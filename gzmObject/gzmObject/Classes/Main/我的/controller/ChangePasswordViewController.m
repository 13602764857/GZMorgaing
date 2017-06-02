//
//  ChangePasswordViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"修改密码";
    [self.rightbutton1 setTitle:@"完成" forState:UIControlStateNormal];
}
-(void)rightbutton1Click{
    [self GZM_Hidden];
    if (_oneTextfile.text.length == 0 || _twoTextFiled.text.length == 0 || _threeTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"密码不能为空" WithVc:self];
        return;
    }
//    if (![_twoTextFiled.text isEqualToString:_threeTextFiled.text]) {
//        [AlerYangShi tishiWithMessage:@"两次密码请一致" WithVc:self];
//        return;
//    }
    if (![_twoTextFiled.text isEqualToString:_threeTextFiled.text]) {
        [AlerYangShi tishiWithMessage:@"两次密码请一致" WithVc:self];
        return;
    }
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifyUserPass] parameters:@{@"token":toketen,@"oldpass":_oneTextfile.text,@"userpass":_twoTextFiled.text} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
//            [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
