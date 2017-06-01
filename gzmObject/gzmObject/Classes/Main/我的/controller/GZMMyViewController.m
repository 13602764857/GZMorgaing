//
//  GZMMyViewController.m
//  gzmObject
//
//  Created by gzm on 2017/4/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMMyViewController.h"
#import "GZmSettingViewController.h"
@interface GZMMyViewController ()

@end

@implementation GZMMyViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.imageView1.hidden = YES;
    self.view.backgroundColor = [UIColor GZMLightColor];
    // Do any additional setup after loading the view.
}
- (IBAction)setButtonClick:(id)sender {
    self.tabBarController.tabBar.hidden = YES;
    GZmSettingViewController * set = [[GZmSettingViewController alloc] init];
    [self.navigationController pushViewController:set animated:YES];
}
- (IBAction)messageClick:(id)sender {
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
