//
//  GZMZongViewController.m
//  gzmObject
//
//  Created by gzm on 2017/4/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMZongViewController.h"
#import "GZMProjectViewController.h"
@interface GZMZongViewController ()

@end

@implementation GZMZongViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatFather];
    [self creatData];
    [self creatUI];
    // Do any additional setup after loading the view.
}

-(void)creatData{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
-(void)creatFather{
    /******* 头部隐藏  *******/
    self.imageView1.hidden = YES;

}

-(void)creatUI{
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    button.backgroundColor = MianColor;
    [button addTarget:self action:@selector(buttonclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}
-(void)buttonclick{
    self.tabBarController.tabBar.hidden = YES;
    GZMProjectViewController * GZMProVc = [[GZMProjectViewController alloc] init];
    [self.navigationController pushViewController:GZMProVc animated:YES];
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
