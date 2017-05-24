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
#import "GZMProjectViewController.h"
#import "GZMequipmentViewController.h"
@interface GZMTabbatViewController ()

@end

@implementation GZMTabbatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GZMProjectViewController * zongVc = [[GZMProjectViewController alloc] init];
    UINavigationController * NVc1 = [[UINavigationController alloc] initWithRootViewController:zongVc];
    GZMMyViewController * vc1 = [[GZMMyViewController alloc] init];
    UINavigationController * nvc2 = [[UINavigationController alloc] initWithRootViewController:vc1];
    GZMequipmentViewController * vc2 = [[GZMequipmentViewController alloc] init];
    UINavigationController * nvc3 = [[UINavigationController alloc] initWithRootViewController:vc2];
    self.viewControllers = @[NVc1,nvc3,nvc2];
    [self GZM_creatTabbar];
    // Do any additional setup after loading the view.
}
/*********修改tabbar*********/
-(void)GZM_creatTabbar{
    //2.2设置tarBar的内容
    //首页
    UINavigationController *leadNav = self.childViewControllers[0];
    leadNav.tabBarItem.title = @"项目中心";
    leadNav.tabBarItem.image = [UIImage imageNamed:@"index_tab1"];
    leadNav.tabBarItem.selectedImage = [UIImage imageNamed:@"index_tab1_a"];
    
    UINavigationController *dataNav = self.childViewControllers[1];
    dataNav.tabBarItem.title = @"设备列表";
    dataNav.tabBarItem.image = [UIImage imageNamed:@"index_tab2"];
    
//    dataNav.tabBarItem.selectedImage = [UIImage imageNameWithOriginalMode:@"index_tab2_a"];
    
    
    UINavigationController *mineNav = self.childViewControllers[2];
    mineNav.tabBarItem.title = @"我的";
    mineNav.tabBarItem.image = [UIImage imageNamed:@"index_tab3"];
    
//    mineNav.tabBarItem.selectedImage = [UIImage imageNameWithOriginalMode:@"index_tab3_a"];
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
