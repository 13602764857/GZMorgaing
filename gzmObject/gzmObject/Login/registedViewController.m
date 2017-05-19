//
//  registedViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/16.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "registedViewController.h"

@interface registedViewController ()

@end

@implementation registedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_CreatFather];
    // Do any additional setup after loading the view.
}
/*********私有父类的方法*********/
-(void)GZM_CreatFather{
    self.imageView1.hidden = YES;
}
- (IBAction)backClick:(id)sender {
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
