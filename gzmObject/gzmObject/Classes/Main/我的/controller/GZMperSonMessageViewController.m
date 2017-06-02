//
//  GZMperSonMessageViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMperSonMessageViewController.h"

@interface GZMperSonMessageViewController ()

@end

@implementation GZMperSonMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"个人信息";
    [self.rightbutton1 setTitle:@"保存" forState:UIControlStateNormal];
}
-(void)rightbutton1Click{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifyNickName] parameters:@{@"token":toketen,@"nickname":self.nameTExtfiled.text} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            [self.navigationController popToRootViewControllerAnimated:YES];
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
