//
//  GZMTabbatViewController.m
//  gzmObject
//
//  Created by gzm on 2017/4/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMTabbatViewController.h"
#import "GZMZongViewController.h"
#import "GZMMyViewController.h"
@interface GZMTabbatViewController ()

@end

@implementation GZMTabbatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GZMZongViewController * zongVc = [[GZMZongViewController alloc] init];
    UINavigationController * NVc1 = [[UINavigationController alloc] initWithRootViewController:zongVc];
    GZMMyViewController * vc1 = [[GZMMyViewController alloc] init];
    UINavigationController * nvc2 = [[UINavigationController alloc] initWithRootViewController:vc1];
    self.viewControllers = @[NVc1,nvc2];
    // Do any additional setup after loading the view.
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
