//
//  GZMDetailEuimentViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMDetailEuimentViewController.h"

@interface GZMDetailEuimentViewController ()

@end

@implementation GZMDetailEuimentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"设备列表详情";
    self.rightbutton1.x = Width - 10 - 100;
    self.rightbutton1.width = 100;
    [self.rightbutton1 setTitle:@"🔍" forState:UIControlStateNormal];
    
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
