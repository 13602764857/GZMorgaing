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
    NSString * id1;
    NSString * id2;
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
            [self.oneButton setTitle:message[@"message"][@"SafetyQuestion1"] forState:UIControlStateNormal];
            [self.twoButton setTitle:message[@"message"][@"SafetyQuestion2"] forState:UIControlStateNormal];
            id1 = [NSString stringWithFormat:@"%@",message[@"message"][@"QuestionID1"]];
            id2 = [NSString stringWithFormat:@"%@",message[@"message"][@"QuestionID2"]];
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
    [self GZM_Hidden];
    if (self.oneTextfiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题一的答案不能为空" WithVc:self];
        return;
    }
    if (self.twoTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题二的答案不能为空" WithVc:self];
        return;
    }
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:VerifySafetyQuestion2] parameters:@{@"username":self.username,@"qid1":id1,@"qid2":id2,@"answer1":self.oneTextfiled.text,@"answer2":self.twoTextFiled.text} successBlock:^(id message) {
        if (issuccess) {
            ChangePasswordViewController * changVc = [[ChangePasswordViewController alloc] init];
            changVc.onlytoken = [NSString stringWithFormat:@"%@",message[@"token"]];
            changVc.encryptToken = [NSString stringWithFormat:@"%@",message[@"encryptToken"]];
            [self presentViewController:changVc animated:YES completion:nil];
        }else{
            [self creatData];
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
