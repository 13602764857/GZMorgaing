//
//  GZMpassWordSecurityViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/31.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMpassWordSecurityViewController.h"
#import "simpleTableVIew.h"
#import "ChangePasswordViewController.h"

#import "GZMChnageOneencryptedViewController.h"
@interface GZMpassWordSecurityViewController ()

@end

@implementation GZMpassWordSecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"密码与安全";
    NSArray * arr = @[@{@"image":@"",@"text":@"修改密码"},@{@"image":@"",@"text":@"修改密保"}];
    simpleTableVIew *simple = [[simpleTableVIew alloc] initWithFrame:CGRectMake(0, 71, Width, 50 *arr.count) withArr:arr With:^(id message) {
        NSInteger num = [message integerValue];
        switch (num) {
            case 0:
            {
                ChangePasswordViewController * changpassword = [[ChangePasswordViewController alloc] init];
                [self.navigationController pushViewController:changpassword animated:YES];
            }
                break;
            case 1:
            {
                GZMChnageOneencryptedViewController * changpassword = [[GZMChnageOneencryptedViewController alloc] init];
                [self.navigationController pushViewController:changpassword animated:YES];            }
                break;
            default:
                break;
        }
    }];
    simple.mainTableview.rowHeight = 50;
    simple.mainTableview.scrollEnabled = NO;
    [self.view addSubview:simple];
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
