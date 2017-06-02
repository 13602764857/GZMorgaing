//
//  GZMChnageOneencryptedViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMChnageOneencryptedViewController.h"
#import "GZMChangeencryptedViewController.h"
@interface GZMChnageOneencryptedViewController ()

@end

@implementation GZMChnageOneencryptedViewController
{
    NSDictionary * dic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self creatData];
    // Do any additional setup after loading the view from its nib.
}
-(void)GZM_creatFather{
    self.mainlable1.text = @"修改密保";
    [self.nextButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
}
-(void)creatData{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetSafetyQuestion] parameters:@{@"token":toketen} successBlock:^(id message) {
        dic = message[@"message"];
        self.questionLable.text = dic[@"SafetyQuestion"];
        self.questionTextFiled.text = @"";
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
- (IBAction)nextClick:(id)sender {
    [self GZM_Hidden];
    if (self.questionTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"密保问题不能为空" WithVc:self];
        return;
    }
    NSDictionary * dic1 = @{@"token":toketen,@"qid":dic[@"QuestionID"],@"answer":self.questionTextFiled.text};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:VerifySafetyQuestion] parameters:dic1 successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            GZMChangeencryptedViewController * gzmVc = [[GZMChangeencryptedViewController alloc] init];
            gzmVc.encryptToken = message[@"message"];
            [self.navigationController pushViewController:gzmVc animated:YES];
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
