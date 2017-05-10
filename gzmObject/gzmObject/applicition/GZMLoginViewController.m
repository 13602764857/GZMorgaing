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
@interface GZMLoginViewController ()<UITextFieldDelegate>

@end

@implementation GZMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userTextField.delegate = self;
    self.passWordTextField.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.y = 0;
        [self.userTextField resignFirstResponder];
        [self.passWordTextField resignFirstResponder];
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)loginClick:(id)sender {
    NSLog(@"23123");
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:UserLogin] parameters:@{@"username":@"yangjian1",@"userpass":@"123qwe",@"valicode":@"zzzzzz"} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqualToNumber:@1]) {
            NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
            [user setObject:message[@"message"] forKey:@"toketen"];
            GZMTabbatViewController * ZongVc = [[GZMTabbatViewController alloc] init];
            //    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:ZongVc];
            [self presentViewController:ZongVc animated:YES completion:nil];
        }
        
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
    
    //    [self.navigationController pushViewController:ZongVc animated:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.y = -64;
    } completion:^(BOOL finished) {
        
    }];
    
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
