//
//  GZMForgetViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMForgetViewController.h"

@interface GZMForgetViewController ()

@end

@implementation GZMForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view from its nib.
}

/*********父类的方法*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"修改密码";
}
-(void)leftbutton1Click{
    [self dismissViewControllerAnimated:YES completion:nil];
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
