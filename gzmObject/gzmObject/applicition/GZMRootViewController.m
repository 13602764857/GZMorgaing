//
//  GZMRootViewController.m
//  gzmObject
//
//  Created by gzm on 2017/4/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMRootViewController.h"
#import "GZMZongViewController.h"
#import "GZMLoginViewController.h"
@interface GZMRootViewController ()

@end

@implementation GZMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/********创建rootView(外部可以调用)*******/
+ (UIViewController *)GZMCreatRootVc{
    UIViewController * RootVc;
//    RootVc = [[GZMZongViewController alloc] init];
    RootVc = [[GZMLoginViewController alloc] init];
    return RootVc;
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
