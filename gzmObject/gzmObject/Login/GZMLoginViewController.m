//
//  GZMLoginViewController.m
//  gzmObject
//
//  Created by gzm on 2017/4/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMLoginViewController.h"
#import "GZMZongViewController.h"
#import "GZMTabbatViewController.h"
#import "registedViewController.h"
#import "GZMForgetViewController.h"
@interface GZMLoginViewController ()<UITextFieldDelegate>

@end

@implementation GZMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userTextField.delegate = self;
    self.passWordTextField.delegate = self;
    [self GZM_creatUI];
    // Do any additional setup after loading the view from its nib.
}
/*********修改UI*********/
-(void)GZM_creatUI{
    [self.userTextField GZMpublicTextFiledPlacehoderWith:[UIColor GZMLightColor] withSize:13 WithholderText:@"请输入账号" Withalignment:NSTextAlignmentCenter];
    UIImageView * userTExtView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"账户"]];
    self.userTextField.leftViewMode = UITextFieldViewModeAlways;
    self.userTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.userTextField.leftView = userTExtView;
    self.userTextField.textAlignment = NSTextAlignmentCenter;
    
    
    [self.passWordTextField GZMpublicTextFiledPlacehoderWith:[UIColor GZMLightColor] withSize:13 WithholderText:@"请输入密码" Withalignment:NSTextAlignmentCenter];
    UIImageView * userTExtView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"密码"]];
    self.passWordTextField.secureTextEntry = YES;
    self.passWordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passWordTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.passWordTextField.leftView = userTExtView1;
    self.passWordTextField.textAlignment = NSTextAlignmentCenter;
     [self.loginBUtton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
     [self.registiedButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#1ba4ff"]];
   
    
}
/*********激活输入框*********/
-(void)GZM_Show{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.y = -64;
    } completion:^(BOOL finished) {
        
    }];
}

/*********激活输入框*********/
-(void)GZM_Hidden{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.y = 0;
        [self.userTextField resignFirstResponder];
        [self.passWordTextField resignFirstResponder];
    } completion:^(BOOL finished) {
        
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self GZM_Hidden];
}
- (IBAction)forgetPassWord:(id)sender {
    [self GZM_Hidden];
    GZMForgetViewController * forget = [[GZMForgetViewController alloc] init];
    [self presentViewController:forget animated:YES completion:nil];
}
- (IBAction)registered:(id)sender {
    [self GZM_Hidden];
    registedViewController * registedVc = [[registedViewController alloc] init];
    [self presentViewController:registedVc animated:YES completion:nil];
}
- (IBAction)loginClick:(id)sender {
    NSLog(@"23123");
    [self GZM_Hidden];
    if (self.userTextField.text.length == 0) {
        [AlerYangShi showMessage:@"账号不能为空" duration:1];
        return;
    }
    if (self.passWordTextField.text.length == 0) {
        [AlerYangShi showMessage:@"密码不能为空" duration:1];
        return;
    }
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:UserLogin] parameters:@{@"username":@"yangjian",@"userpass":@"123qwe",@"valicode":@"zzzzzz"} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqualToNumber:@1]) {
            NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
            [user setObject:message[@"message"] forKey:@"toketen"];
            GZMTabbatViewController * ZongVc = [[GZMTabbatViewController alloc] init];
            //    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:ZongVc];
            [self presentViewController:ZongVc animated:YES completion:nil];
        }else{
            [AlerYangShi showMessage:message[@"message"] duration:1];
        }
        
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
    
    //    [self.navigationController pushViewController:ZongVc animated:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self GZM_Show];
    
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
