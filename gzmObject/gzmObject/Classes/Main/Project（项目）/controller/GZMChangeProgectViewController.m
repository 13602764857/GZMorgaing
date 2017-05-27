//
//  GZMChangeProgectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMChangeProgectViewController.h"

@interface GZMChangeProgectViewController ()<UITextFieldDelegate>
/**********<#属性#> ************/
@property(nonatomic,strong)UIScrollView * MainScrollview;
@end

@implementation GZMChangeProgectViewController
{
    UITextView * textView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self GZM_creatUI];
    // Do any additional setup after loading the view.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"项目修改";
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
        
        UITextField *titleLable1 = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), 220, 43.5)];
        titleLable1.tag = 100 + i;
        titleLable1.text = dataArr[i];
        titleLable1.font = [UIFont systemFontOfSize:12];
        
        if (i == 2) {
            titleLable1.font = [UIFont systemFontOfSize:11];
        }
        if (i > 0 && i < 4) {
            titleLable1.delegate = self;
            
        }else{
            titleLable1.textColor = [UIColor GZMTitleColor];
        }
        if (i == 5 || i == 6 || i == 7) {
            
        }else{
            [_MainScrollview addSubview:titleLable1];
        }
        [Marr addObject:titleLable];
    }
    UILabel * numlable = (UILabel *)Marr.lastObject;
    textView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMinX(numlable.frame), CGRectGetMaxY(numlable.frame), Width - numlable.x *2, 130)];
//    textView.editable = NO;
    textView.textColor = [UIColor GZMTitleColor];
    [textView GZMchangeStyleWith:0 withborad:1 withBoardColor:[UIColor GZMLightColor]];
    textView.text = self.Projectmodel.Remark;
    [_MainScrollview addSubview:textView];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, _MainScrollview.contentSize.height - 50, Width, 50)];
    button.backgroundColor = MianColor;
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(proClick) forControlEvents:UIControlEventTouchUpInside];
    [_MainScrollview addSubview:button];
}
-(UIScrollView *)MainScrollview{
    if (!_MainScrollview) {
        _MainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 7, Width, Height - 64 -7)];
        _MainScrollview.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenClick)];
        [_MainScrollview addGestureRecognizer:tap];
        _MainScrollview.contentSize = CGSizeMake(Width, 550);
    }
    return _MainScrollview;
}
-(void)hiddenClick{
    [self GZM_Hidden];
}
-(void)proClick{
    UITextField * protextFile = (UITextField *)[self.view viewWithTag:100];
    UITextField * VersionstextFile = (UITextField *)[self.view viewWithTag:104];
    if (protextFile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目名称不能为零" WithVc:self];
        return;
    }
    if (VersionstextFile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目名称不能为零" WithVc:self];
        return;
    }

    if (textView.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目名称不能为零" WithVc:self];
        return;
    }
    NSDictionary * dic = @{@"token":toketen,@"projectid":self.Projectmodel.ProjectID,@"pname":@"",@"version":@"",@"platformid":@"",@"remark":@"",@"trialTime":@"",@"userpass":@"",@"effective":@""};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifyProject] parameters:dic successBlock:^(id message) {
        
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.tag > 100 && textField.tag < 104) {
        [self GZM_Hidden];
    }
    return NO;
}
-(void)leftbutton1Click{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*********输入框*********/
-(void)GZM_Hidden{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.y = 0;
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    } completion:^(BOOL finished) {
        
    }];
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
