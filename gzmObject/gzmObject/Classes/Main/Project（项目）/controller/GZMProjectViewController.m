//
//  GZMProjectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/8.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMProjectViewController.h"

@interface GZMProjectViewController ()

@end

@implementation GZMProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.GZMTableView];
    self.GZMTableView.frame = CGRectMake(0, 64, Width, Height - 64);
    // Do any additional setup after loading the view.
}
-(void)leftbutton1Click{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)creatData{
    [self.GZMTableView.mj_header endRefreshing];
    NSLog(@"qweqe");
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
