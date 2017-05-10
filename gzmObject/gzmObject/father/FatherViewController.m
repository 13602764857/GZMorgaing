//
//  FatherViewController.m
//  GzAgent
//
//  Created by gzm on 15/12/17.
//  Copyright © 2015年 gzcentaline. All rights reserved.
//

#import "FatherViewController.h"

@interface FatherViewController ()

@end

@implementation FatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self creatView];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

    

    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
   
}
/*********<#私有方法#>*********/
-(void)creatFather{

}

-(void)creatUI{

}

-(void)creatData{

}

-(void)creatView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,Width, 64)];
    self.imageView1.userInteractionEnabled = YES;
    self.imageView1.backgroundColor = MianColor;
    [self.view addSubview:self.imageView1];
    
    
    self.leftbutton1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 25, 60, 34)];
    [self.leftbutton1 setTitle:@"    " forState:UIControlStateNormal];
    [self.leftbutton1 addTarget:self action:@selector(leftbutton1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.imageView1 addSubview:self.leftbutton1];
    
    
    self.mainlable1  = [[UILabel alloc]initWithFrame:CGRectMake(55,25,Width-120, 34)];
    self.mainlable1.textAlignment = NSTextAlignmentCenter;
    self.mainlable1.textColor = [UIColor whiteColor];
    [self.imageView1 addSubview:self.mainlable1];
    
    self.rightbutton1 = [[UIButton alloc]initWithFrame:CGRectMake(Width-45, 25, 40, 34)];
    self.rightbutton1.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.rightbutton1 addTarget:self action:@selector(rightbutton1Click) forControlEvents:UIControlEventTouchUpInside];
    //    self.rightbutton1.backgroundColor = [UIColor whiteColor];
    [self.imageView1 addSubview:self.rightbutton1];
    
    [self.leftbutton1 setImage:[UIImage imageNamed:@"Back_arrow"] forState:UIControlStateNormal];
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
   
    return UIStatusBarStyleLightContent;
    
}

-(void)leftbutton1Click
{
    //取消所有的请求
//    [[AFHTTPSessionManager manager].operationQueue cancelAllOperations];
}

-(void)rightbutton1Click
{
    
    
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
