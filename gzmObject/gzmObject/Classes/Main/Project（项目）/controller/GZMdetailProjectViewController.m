//
//  GZMdetailProjectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMdetailProjectViewController.h"
#import "GZMActivationViewController.h"
#import "GZMChangeProgectViewController.h"
@interface GZMdetailProjectViewController ()
/**********<#属性#> ************/
@property(nonatomic,strong)UIScrollView * MainScrollview;

@end

@implementation GZMdetailProjectViewController
{
    UIImageView * Moreimage;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self GZM_creatUI];
    [self GZM_creatMore];
    // Do any additional setup after loading the view from its nib.
}

/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"项目详情";
    [self.rightbutton1 setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
}
/*********更多的操作*********/
-(void)GZM_creatMore{
    Moreimage = [[UIImageView alloc] initWithFrame:CGRectMake(Width - 100 - 10, 64, 100, 130)];
    Moreimage.hidden = YES;
//    Moreimage.backgroundColor = MianColor;
    Moreimage.image = [UIImage imageNamed:@"形状-13"];
    Moreimage.userInteractionEnabled = YES;
    [self.view addSubview:Moreimage];
    
    NSArray * titleArr = @[@"编辑项目",@"查看事例",@"查看激活码"];
    for (int i = 0; i < titleArr.count; i ++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 10 + 40 *i, Moreimage.width, 40)];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [Moreimage addSubview:button];
        if (i != titleArr.count - 1) {
            UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(5, button.height - 1, button.width - 10, 1)];
            lable.backgroundColor = [UIColor whiteColor];
            [button addSubview:lable];
            
        }
    }
}

-(void)moreClick:(UIButton *)button{
    [self hiddenClick];
    switch (button.tag) {
        case 100:
        {
            GZMChangeProgectViewController * GZMac = [[GZMChangeProgectViewController alloc] init];
            GZMac.Projectmodel = self.Projectmodel;
            [self presentViewController:GZMac animated:YES completion:nil];
        }
            break;
        case 101:
        {
            
        }
            break;
        case 102:
        {
            GZMActivationViewController * GZMac = [[GZMActivationViewController alloc] init];
            GZMac.Projectmodel = self.Projectmodel;
            [self.navigationController pushViewController:GZMac animated:YES];
        }
            break;
        default:
            break;
    }
    
}

/*********<#私有方法#>*********/
-(void)GZM_creatUI{
    [self.view addSubview:self.MainScrollview];
    /********** 装控件的数组************/
    NSMutableArray * Marr = [NSMutableArray array];
    NSArray * titleArr = @[@"项目名称：",@"创建日期：",@"APP ID   ：",@"使用人数：",@"版  本  号：",@"所属平台：",@"项目状态：",@"项目描述："];
    NSArray * dataArr = @[self.Projectmodel.ProjectName,self.Projectmodel.CreateDate,self.Projectmodel.AppID,self.Projectmodel.Count,self.Projectmodel.Versions,self.Projectmodel.PlatformName,[self.Projectmodel.Effective integerValue] == 1 ?@"有效":@"无效",@""];
    for (int i = 0; i < titleArr.count; i ++) {
        UILabel * imageLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 44*i, Width, 0.5)];
        imageLable.backgroundColor = [UIColor GZMLightColor];
        [_MainScrollview addSubview:imageLable];
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(imageLable.frame), 70, 43.5)];
        titleLable.text = titleArr[i];
        titleLable.font = [UIFont systemFontOfSize:13];
        [_MainScrollview addSubview:titleLable];
        
        UILabel *titleLable1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), 220, 43.5)];
        titleLable1.textColor = [UIColor GZMTitleColor];
        titleLable1.text = dataArr[i];
        titleLable1.font = [UIFont systemFontOfSize:12];
        if (i == 2) {
            titleLable1.font = [UIFont systemFontOfSize:11];
        }
        [_MainScrollview addSubview:titleLable1];
        [Marr addObject:titleLable];
    }
    UILabel * numlable = (UILabel *)Marr.lastObject;
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMinX(numlable.frame), CGRectGetMaxY(numlable.frame), Width - numlable.x *2, 130)];
    textView.editable = NO;
    [textView GZMchangeStyleWith:0 withborad:1 withBoardColor:[UIColor GZMLightColor]];
    textView.text = self.Projectmodel.Remark;
    [_MainScrollview addSubview:textView];
}
-(UIScrollView *)MainScrollview{
    if (!_MainScrollview) {
        _MainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 7, Width, Height - 64 -7)];
        _MainScrollview.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenClick)];
        [_MainScrollview addGestureRecognizer:tap];
        _MainScrollview.contentSize = CGSizeMake(Width, 500);
    }
    return _MainScrollview;
}
-(void)hiddenClick{
    Moreimage.hidden = YES;
    self.rightbutton1.selected = NO;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hiddenClick];
}

-(void)leftbutton1Click{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightbutton1Click{
    Moreimage.hidden = (self.rightbutton1.selected == YES) ? YES :NO;
    self.rightbutton1.selected = !self.rightbutton1.selected;
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
