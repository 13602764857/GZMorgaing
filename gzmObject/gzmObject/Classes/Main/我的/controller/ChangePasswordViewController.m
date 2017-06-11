//
//  ChangePasswordViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "GZMLoginViewController.h"
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
    if (self.onlytoken.length > 0) {
        self.oneViewHeight.constant = 0;
    }
    self.mainlable1.text = @"修改密码";
    [self.rightbutton1 setTitle:@"完成" forState:UIControlStateNormal];
}
-(void)rightbutton1Click{
    [self GZM_Hidden];
    if ( _twoTextFiled.text.length == 0 || _threeTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"密码不能为空" WithVc:self];
        return;
    }
//    if (![_twoTextFiled.text isEqualToString:_threeTextFiled.text]) {
//        [AlerYangShi tishiWithMessage:@"两次密码请一致" WithVc:self];
//        return;
//    }
    if ( _twoTextFiled.text.length < 6 || _threeTextFiled.text.length < 6) {
        [AlerYangShi tishiWithMessage:@"密码长度至少6位" WithVc:self];
        return;
    }    if (![_twoTextFiled.text isEqualToString:_threeTextFiled.text]) {
        [AlerYangShi tishiWithMessage:@"两次密码请一致" WithVc:self];
        return;
    }
    if (self.onlytoken.length > 0) {
        [AlerYangShi creatTitleWith:@"是否确定修改密码" creatOneWith:nil withTwoStr:@"修改" WithVc:self withSuccessBlock:^{
            [self creatNoOldPassWord];
        } withErrorBlock:^{
            
        }];
        
        return;
    }
    if (  _oneTextfile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"密码不能为空" WithVc:self];
        return;
    }

    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifyUserPass] parameters:@{@"token":toketen,@"oldpass":_oneTextfile.text,@"userpass":_twoTextFiled.text} successBlock:^(id message) {
        
        if ([message[@"issuccess"] isEqual:@1]) {
            [AlerYangShi showMessage:message[@"message"] duration:1];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
//            [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
/********** 不要旧密码请求************/
-(void)creatNoOldPassWord{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ResetPass] parameters:@{@"token":_onlytoken,@"encryptToken":_encryptToken,@"userpass":_twoTextFiled.text} successBlock:^(id message) {
        
        if ([message[@"issuccess"] isEqual:@1]) {
                GZMLoginViewController * loginVc = [[GZMLoginViewController alloc] init];
                [self presentViewController:loginVc animated:YES completion:nil];
                return ;
        }else{
            //            [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
-(void)leftbutton1Click{
    if (self.navigationController.viewControllers.count < 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return ;
    }
    [self.navigationController popViewControllerAnimated:YES];

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
