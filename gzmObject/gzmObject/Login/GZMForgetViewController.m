//
//  GZMForgetViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMForgetViewController.h"
#import "ChangePasswordViewController.h"
@interface GZMForgetViewController ()<UITextFieldDelegate>

@end

@implementation GZMForgetViewController
{
    NSDictionary * questionDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self creatData];
    // Do any additional setup after loading the view from its nib.
}
-(void)creatData{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetQuestionByUserName] parameters:@{@"username":self.username} successBlock:^(id message){
        if ([message[@"issuccess"] isEqual:@1]) {
            questionDic = message[@"message"];
            [self.oneButton setTitle:questionDic[@"SafetyQuestion1"] forState:UIControlStateNormal];
            [self.twoButton setTitle:questionDic[@"SafetyQuestion2"] forState:UIControlStateNormal];
            self.oneTextfiled.text = @"";
            self.twoTextFiled.text = @"";
        }else{
            
        }
        
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
/*********父类的方法*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"修改密码";
    [self.oneButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.twoButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.threeButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.nextButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    self.threeTextFiled.delegate = self;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self GZMpublic_show];
}
-(void)leftbutton1Click{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)nextClick:(id)sender {
    ChangePasswordViewController * changVc = [[ChangePasswordViewController alloc] init];
    [self presentViewController:changVc animated:YES completion:nil];
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
