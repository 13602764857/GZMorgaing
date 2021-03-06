//
//  GZMChangeProgectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMChangeProgectViewController.h"
#import "leftButton.h"
#import "tableVIew.h"
#import "GZMpickerView.h"
#import "YaoqingView.h"
@interface GZMChangeProgectViewController ()<UITextFieldDelegate,UITextViewDelegate,UIGestureRecognizerDelegate>
/**********<#属性#> ************/
@property(nonatomic,strong)UIScrollView * MainScrollview;
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * langIDArr;
@end

@implementation GZMChangeProgectViewController
{
    UITextView * textView;
    leftButton * languageButton;
    leftButton * ClassButton;
    NSString * langID;
    NSString * platformid;
    NSString * projectid;
//    tableVIew * tableView;
    GZMpickerView * MypickerView;
    NSArray * dataArr;
    NSString * languageStr;
    UIButton * trueButton;
    UIButton * falseButton;
    UIButton * Savebutton;
    YaoqingView * yaoqingView1;
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
    langID = self.Projectmodel.LangID;
    platformid = self.Projectmodel.PlatformID;
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
        
        UITextField *titleLable1 = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), 250, 43.5)];
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
            if (i == 5) {
                languageButton = [[leftButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame) + 10, CGRectGetMaxY(imageLable.frame), (Width - titleLable.width - 10 - 20) - 10, 43.5)];
                //            languageButton.backgroundColor = [UIColor redColor];
                NSString * str = [NSString stringWithFormat:@"%@,%@",[self.languageArr GZMpublicSetStrWith:self.Projectmodel.LangID andStr:@"LangID" getStr:@"LangName"],self.Projectmodel.PlatformName];
                [languageButton setTitle:str forState:UIControlStateNormal];
                languageButton.titleLabel.font = [UIFont systemFontOfSize:13];
                [languageButton setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
                [languageButton addTarget:self action:@selector(leftbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
                [_MainScrollview addSubview:languageButton];
                

            }
            if (i == 6) {
                
                trueButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), (Width - titleLable.width - 10)/2 - 10, 43.5)];
                [trueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [trueButton setTitle:@"  有效" forState:UIControlStateNormal];
                [trueButton setImage:[UIImage imageNamed:@"待选"] forState:UIControlStateNormal];
                if ([self.Projectmodel.Effective isEqualToString:@"1"]) {
                   trueButton.selected = YES;
                }
                [trueButton setImage:[UIImage imageNamed:@"选择"] forState:UIControlStateSelected];
                trueButton.titleLabel.font = [UIFont systemFontOfSize:14];
                [trueButton addTarget:self action:@selector(trueClick:) forControlEvents:UIControlEventTouchUpInside];
                
//                trueButton.backgroundColor = MianColor;
                [_MainScrollview addSubview:trueButton];
               
                falseButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(trueButton.frame) + 10, CGRectGetMaxY(imageLable.frame), (Width - titleLable.width - 10)/2 - 10, 43.5)];
                [falseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                if ([self.Projectmodel.Effective isEqualToString:@"0"]) {
                    falseButton.selected = YES;
                }
                [falseButton setTitle:@"  无效" forState:UIControlStateNormal];
                [falseButton setImage:[UIImage imageNamed:@"待选"] forState:UIControlStateNormal];
                [falseButton setImage:[UIImage imageNamed:@"选择"] forState:UIControlStateSelected];
                falseButton.titleLabel.font = [UIFont systemFontOfSize:14];
                [falseButton addTarget:self action:@selector(trueClick:) forControlEvents:UIControlEventTouchUpInside];
                
                //                trueButton.backgroundColor = MianColor;
                [_MainScrollview addSubview:falseButton];
                
                
            }
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
    textView.delegate = self;
    textView.text = self.Projectmodel.Remark;
    [_MainScrollview addSubview:textView];
    
    CGFloat btHeight = (_MainScrollview.height > _MainScrollview.contentSize.height)?_MainScrollview.height:_MainScrollview.contentSize.height;
    Savebutton = [[UIButton alloc] initWithFrame:CGRectMake(0, btHeight - 50, Width, 50)];
    Savebutton.backgroundColor = MianColor;
    [Savebutton setTitle:@"保存" forState:UIControlStateNormal];
    [Savebutton addTarget:self action:@selector(proClick) forControlEvents:UIControlEventTouchUpInside];
    [_MainScrollview addSubview:Savebutton];
    
    leftButton * YaoqingButton = [[leftButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textView.frame) + 5, 180, 40)];
    YaoqingButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [YaoqingButton addTarget:self action:@selector(YaoqingClick:) forControlEvents:UIControlEventTouchUpInside];
    [YaoqingButton setTitle:@"是否开启邀请功能" forState:UIControlStateNormal];
    [YaoqingButton setImage:[UIImage imageNamed:@"待选"] forState:UIControlStateNormal];
    [YaoqingButton setImage:[UIImage imageNamed:@"选择"] forState:UIControlStateSelected];
    
    [_MainScrollview addSubview:YaoqingButton];
    
    yaoqingView1  = [[YaoqingView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(YaoqingButton.frame )+ 5, Width - 20, 300) withDic:@[self.Projectmodel.LargessDay,@"",self.Projectmodel.ReachDay,self.Projectmodel.ReachTimes]];
    yaoqingView1.hidden = YES;
    __weak GZMChangeProgectViewController * Sself = self;
    yaoqingView1.deleteBookBlock = ^{
        [Sself GZMpublic_show];
    };

    [_MainScrollview addSubview:yaoqingView1];
}
/********** 邀请功能是否开启************/
-(void)YaoqingClick:(UIButton *)button{
    button.selected = !button.selected;
    if (button.selected) {
        yaoqingView1.hidden = NO;
        _MainScrollview.contentSize = CGSizeMake(Width, 900);
    }else{
        yaoqingView1.hidden = YES;
        _MainScrollview.contentSize = CGSizeMake(Width, 500);
    }
     CGFloat btHeight = (_MainScrollview.height > _MainScrollview.contentSize.height)?_MainScrollview.height:_MainScrollview.contentSize.height;
    Savebutton.y = btHeight - 50;
}
/********** 有效无效的选择************/
-(void)trueClick:(UIButton *)button{
    trueButton.selected = NO;
    falseButton.selected = NO;
    button.selected = YES;
}
/*********获取平台列表*********/
-(void)GZM_getPlatformList{
    [RequestTool sendGetAFRequest:[BaseUrl stringByAppendingString:GetPlatformList] parameters:@{@"langID":langID} successBlock:^(id message) {
        
        dataArr = message[@"message"];
        platformid = dataArr[0][@"PlatformID"];
        MypickerView.secondData = [dataArr GZMpublicSetArrWithStr:@"PlatformName"];
        [MypickerView.myPickerView reloadAllComponents ];
        [languageButton setTitle:[NSString stringWithFormat:@"%@,%@",languageStr,MypickerView.secondData[0]] forState:UIControlStateNormal];

    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
/********** 选择语言分类点击事件  ************/
-(void)leftbuttonClick:(UIButton *)button{
    [self GZM_Hidden];

    [MypickerView removeFromSuperview];
    MypickerView = [[GZMpickerView alloc] initWithFrame:CGRectMake(0, Height - 250, Width, 250) withArr:[self.languageArr GZMpublicSetArrWithStr:@"LangName"] With:^(id message) {
        if ([message[@"component"] isEqualToString:@"0"]) {
            langID =  [self.languageArr GZMpublicSetStrWith:message[@"row"] andStr:@"LangName" getStr:@"LangID"];
            languageStr = message[@"row"];
            [self GZM_getPlatformList];
        }else{
            platformid = [dataArr GZMpublicSetStrWith:message[@"row"] andStr:@"PlatformName" getStr:@"PlatformID"];
            [languageButton setTitle:[NSString stringWithFormat:@"%@,%@",languageStr,message[@"row"]] forState:UIControlStateNormal];
        }
        
    }];
    [self.view addSubview:MypickerView];
}

-(UIScrollView *)MainScrollview{
    if (!_MainScrollview) {
        _MainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 7, Width, Height - 64 -7)];
        _MainScrollview.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenClick)];
        [_MainScrollview addGestureRecognizer:tap];
        tap.delegate = self;
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
    UITextField * VersionstextFile1 = (UITextField *)[self.view viewWithTag:110];
    UITextField * VersionstextFile2 = (UITextField *)[self.view viewWithTag:112];
    UITextField * VersionstextFile3 = (UITextField *)[self.view viewWithTag:113];
    if (protextFile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目名称不能为零" WithVc:self];
        return;
    }
    if (VersionstextFile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"版本号不能为零" WithVc:self];
        return;
    }
        if (textView.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目描述不能为零" WithVc:self];
        return;
    }
    if (!yaoqingView1.hidden) {
        if (VersionstextFile1.text.length == 0) {
            [AlerYangShi tishiWithMessage:@"开启邀请功能后，有效期不能为空" WithVc:self];
            return;
        }
        if (VersionstextFile2.text.length == 0) {
            [AlerYangShi tishiWithMessage:@"开启邀请功能后，使用时长不能为空" WithVc:self];
            return;
        }
        if (VersionstextFile3.text.length == 0) {
            [AlerYangShi tishiWithMessage:@"开启邀请功能后，使用次数不能为空" WithVc:self];
            return;
        }
        
    }

    
    NSDictionary * dic = @{@"token":toketen,@"projectid":self.Projectmodel.ProjectID,@"pname":protextFile.text,@"version":VersionstextFile.text,@"platformid":platformid,@"remark":textView.text,@"trialTime":@"",@"userpass":@"",@"effective":trueButton.selected == YES?@"true":@"false",@"invite":yaoqingView1.hidden == NO?@"true":@"false",@"gessday":VersionstextFile1.text.length > 0 ?VersionstextFile1.text:@"0",@"reachDay":VersionstextFile2.text.length > 0 ?VersionstextFile2.text:@"0",@"reachtimes":VersionstextFile3.text.length > 0 ?VersionstextFile3.text:@"0"};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifyProject] parameters:dic successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GZMProjectViewController" object:nil userInfo:nil];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
        }
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
    [self.navigationController popViewControllerAnimated:YES];
}
/*********输入框*********/
//-(void)GZM_Hidden{
//    [MypickerView removeFromSuperview];
//    [UIView animateWithDuration:0.25 animations:^{
//        self.MainScrollview.contentOffset = CGPointMake(0, 0);
//        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
//    } completion:^(BOOL finished) {
//        
//    }];
//}
/*********激活输入框*********/
//-(void)GZM_Show{
//    [UIView animateWithDuration:0.25 animations:^{
//        self.MainScrollview.contentOffset = CGPointMake(0, 150);
//    } completion:^(BOOL finished) {
//        
//    }];
//}

-(void)textViewDidBeginEditing:(UITextView *)textView{
     [self GZMpublic_show:150];
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
