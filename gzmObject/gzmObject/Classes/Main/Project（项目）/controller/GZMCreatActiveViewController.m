//
//  GZMCreatActiveViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMCreatActiveViewController.h"

@interface GZMCreatActiveViewController ()

@end

@implementation GZMCreatActiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"生成激活码";
    self.view.backgroundColor = [UIColor GZMLightColor];
    self.projectTitle.text = self.Projectmodel.ProjectName;
}
- (IBAction)confirmClick:(id)sender {
    if (self.timeTextFiled.text.length == 0 || self.timeTextFiled.text.length == 4) {
        [AlerYangShi tishiWithMessage:@"天数在0 - 999" WithVc:self];
        return;
    }
    if (self.numTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"请输入生成个数" WithVc:self];
        return;
    }
    if ([self.numTextFiled.text integerValue] > 100) {
        [AlerYangShi tishiWithMessage:@"生成个数不能超过100" WithVc:self];
        return;
    }
    NSDictionary * dic =@{@"token":toketen,@"projectID":self.Projectmodel.ProjectID,@"day":self.timeTextFiled.text,@"num":self.numTextFiled.text};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GenAuthCode] parameters:dic successBlock:^(id message) {
        
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
