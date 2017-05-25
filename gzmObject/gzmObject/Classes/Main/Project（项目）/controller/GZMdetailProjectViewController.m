//
//  GZMdetailProjectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMdetailProjectViewController.h"

@interface GZMdetailProjectViewController ()
/**********<#属性#> ************/
@property(nonatomic,strong)UIScrollView * MainScrollview;
@end

@implementation GZMdetailProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self GZM_creatUI];
    // Do any additional setup after loading the view from its nib.
}

/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"项目详情";
}
/*********<#私有方法#>*********/
-(void)GZM_creatUI{
    [self.view addSubview:self.MainScrollview];
    NSArray * titleArr = @[@"项目名称：",@"创建日期：",@"APP ID   ：",@"使用人数：",@"版  本  号：",@"所属平台：",@"项目状态：",@"项目描述："];
    for (int i = 0; i < titleArr.count; i ++) {
        UILabel * imageLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 + 50*i, Width, 0.5)];
        imageLable.backgroundColor = MianColor;
        [_MainScrollview addSubview:imageLable];
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(imageLable.frame), 80, 49.5)];
        titleLable.text = titleArr[i];
        titleLable.font = [UIFont systemFontOfSize:13];
        [_MainScrollview addSubview:titleLable];
        
        UILabel *titleLable1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), 180, 49.5)];
        titleLable1.text = titleArr[i];
        titleLable1.font = [UIFont systemFontOfSize:13];
        [_MainScrollview addSubview:titleLable1];
        
    }
}
-(UIScrollView *)MainScrollview{
    if (!_MainScrollview) {
        _MainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Width, Height - 64)];
    }
    return _MainScrollview;
}

-(void)leftbutton1Click{
    [self.navigationController popViewControllerAnimated:YES];
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
