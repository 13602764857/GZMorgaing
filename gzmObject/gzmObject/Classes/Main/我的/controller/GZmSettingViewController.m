//
//  GZmSettingViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/31.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZmSettingViewController.h"
#import "simpleTableVIew.h"
#import "GZMpassWordSecurityViewController.h"
#import "GZMperSonMessageViewController.h"
@interface GZmSettingViewController ()

@end

@implementation GZmSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"设置";
    NSArray * arr = @[@{@"image":@"形状-2",@"text":@"修改个人信息"},@{@"image":@"密",@"text":@"密码与安全"}];
    simpleTableVIew *simple = [[simpleTableVIew alloc] initWithFrame:CGRectMake(0, 71, Width, 50 *arr.count) withArr:arr With:^(id message) {
       NSInteger num = [message integerValue];
        switch (num) {
            case 0:
            {
                GZMperSonMessageViewController * GZMVc = [[GZMperSonMessageViewController alloc] init];
                GZMVc.userMo = self.userMo;
                [self.navigationController pushViewController:GZMVc animated:YES];
            }
                break;
            case 1:
            {
                GZMpassWordSecurityViewController * gzmPAss = [[GZMpassWordSecurityViewController alloc] init];
                [self.navigationController pushViewController:gzmPAss animated:YES];
            }
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
