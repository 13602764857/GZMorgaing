//
//  GZMCreatViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMCreatViewController.h"
#import "leftButton.h"
#import "tableVIew.h"
#import "GZMpickerView.h"
#import "YaoqingView.h"
@interface GZMCreatViewController ()<UITextFieldDelegate,UITextViewDelegate,UIGestureRecognizerDelegate>
/**********<#属性#> ************/
@property(nonatomic,strong)UIScrollView * MainScrollview;
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * langIDArr;
@end

@implementation GZMCreatViewController
{
    UITextView * textView;
    leftButton * languageButton;
    leftButton * ClassButton;
    NSString * langID;
    NSString * platformid;
    NSString * projectid;
    tableVIew * tableView;
    GZMpickerView * MypickerView;
    NSArray * dataArr;
    NSString * languageStr;
    UIButton * Savebutton;
    YaoqingView * yaoqingView1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self creatData];
    
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    langID = [NSString stringWithFormat:@"%@",_languageArr[0][@"langID"]];
    
    self.mainlable1.text = @"创建项目";
}
-(void)creatData{
    [RequestTool sendGetAFRequest:[BaseUrl stringByAppendingString:GetPlatformList] parameters:@{@"langID":langID} successBlock:^(id message) {
        _langIDArr = message[@"message"];
        platformid = [NSString stringWithFormat:@"%@",_langIDArr[0][@"PlatformID"]];
        if (!textView) {
            [self GZM_creatUI];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
/*********私有方法*********/
-(void)GZM_creatUI{
    [self.view addSubview:self.MainScrollview];
    /********** 装控件的数组************/
    NSMutableArray * Marr = [NSMutableArray array];
    NSArray * placeholderArr = @[@"请输入项目名称",@"请输入版本信息",@"请输入单次试用时长（秒）"];
    NSArray * titleArr = @[@"项目名称：",@"版  本  号：",@"试用时长",@"所属平台：",@"项目描述："];
    for (int i = 0; i < titleArr.count; i ++) {
        UILabel * imageLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 44*i, Width, 0.5)];
        imageLable.backgroundColor = [UIColor GZMLightColor];
        [_MainScrollview addSubview:imageLable];
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(imageLable.frame), 70, 43.5)];
        titleLable.text = titleArr[i];
        titleLable.font = [UIFont systemFontOfSize:13];
        [_MainScrollview addSubview:titleLable];
        
        UITextField *titleLable1 = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), 220, 43.5)];
        if (i  == 0 || i == 1 || i == 2) {
            titleLable1.tag = 100 + i;
            titleLable1.delegate = self;
            titleLable1.font = [UIFont systemFontOfSize:13];
            titleLable1.placeholder = placeholderArr[i];
            [_MainScrollview addSubview:titleLable1];
            if (i == 2 ) {
                titleLable1.keyboardType = UIKeyboardTypeNumberPad;
            }
            if (i == 1) {
                titleLable1.keyboardType = UIKeyboardTypeDecimalPad;
            }
        }
        
        if (i == 3) {
            languageButton = [[leftButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame) + 10, CGRectGetMaxY(imageLable.frame), (Width - titleLable.width - 10 - 20) - 10, 43.5)];
            
            [languageButton setTitle:@"请选择平台" forState:UIControlStateNormal];
            languageButton.titleLabel.font = [UIFont systemFontOfSize:13];
            [languageButton setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
            [languageButton addTarget:self action:@selector(leftbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_MainScrollview addSubview:languageButton];
            

        }
        
        [Marr addObject:titleLable];
    }
    UILabel * numlable = (UILabel *)Marr.lastObject;
    textView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMinX(numlable.frame), CGRectGetMaxY(numlable.frame), Width - numlable.x *2, 130)];
    //    textView.editable = NO;
    textView.textColor = [UIColor GZMTitleColor];
    [textView GZMchangeStyleWith:0 withborad:1 withBoardColor:[UIColor GZMLightColor]];
    textView.delegate = self;
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
    
    yaoqingView1  = [[YaoqingView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(YaoqingButton.frame )+ 5, Width - 20, 300) withDic:@[@"",@"",@"",@""]];
    yaoqingView1.hidden = YES;
    __weak GZMCreatViewController * Sself = self;
    yaoqingView1.deleteBookBlock = ^{
        [Sself GZMpublic_show];
    };
    [_MainScrollview addSubview:yaoqingView1];
}
/********** 邀请功能是否开启************/
-(void)YaoqingClick:(UIButton *)button{
    [self GZM_Hidden];
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

/*********获取平台列表*********/
-(void)GZM_getPlatformList{
    [RequestTool sendGetAFRequest:[BaseUrl stringByAppendingString:GetPlatformList] parameters:@{@"langID":langID} successBlock:^(id message) {

        dataArr = message[@"message"];
        [ClassButton setTitle:dataArr[0][@"PlatformName"] forState:UIControlStateNormal];
        platformid = dataArr[0][@"PlatformID"];
        MypickerView.secondData = [dataArr GZMpublicSetArrWithStr:@"PlatformName"];
        [MypickerView.myPickerView reloadAllComponents ];
        [languageButton setTitle:[NSString stringWithFormat:@"%@,%@",languageStr,MypickerView.secondData[0]] forState:UIControlStateNormal];

//        tableView = [[tableVIew alloc]initWithFrame:CGRectMake(CGRectGetMinX(ClassButton.frame), CGRectGetMaxY(ClassButton.frame), ClassButton.width, 150) withArr:[arr GZMpublicSetArrWithStr:@"PlatformName"] With:^(id message) {
//            NSLog(@"%@",message);
//            [ClassButton setTitle:message forState:UIControlStateNormal];
//            platformid = [arr GZMpublicSetStrWith:message andStr:@"PlatformName" getStr:@"PlatformID"];
//            [tableView removeFromSuperview];
//        }];
//        [_MainScrollview addSubview:tableView];
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
/********** 选择语言分类点击事件  ************/
-(void)leftbuttonClick:(UIButton *)button{
    [self GZM_Hidden];
//    [tableView removeFromSuperview];
//    if (button != languageButton) {
//        [self GZM_getPlatformList];
//        return;
//    }
//    tableView = [[tableVIew alloc]initWithFrame:CGRectMake(CGRectGetMinX(button.frame), CGRectGetMaxY(button.frame), button.width, 150) withArr:[self.languageArr GZMpublicSetArrWithStr:@"LangName"] With:^(id message) {
//        NSLog(@"%@",message);
//        langID =  [self.languageArr GZMpublicSetStrWith:message andStr:@"LangName" getStr:@"LangID"];
//        [languageButton setTitle:message forState:UIControlStateNormal];
//        [tableView removeFromSuperview];
//        [self leftbuttonClick:ClassButton];
//    }];
//    [_MainScrollview addSubview:tableView];
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
//        _MainScrollview.cancelsTouchesInView = NO;
        tap.delegate = self;
        _MainScrollview.contentSize = CGSizeMake(Width, 490);
    }
    return _MainScrollview;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    // 输出点击的view的类名
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"])
    {
        return NO;
    }
    
    //截获Touch事件
    return  YES;
    
}

-(void)hiddenClick{
    [self GZM_Hidden];
}
-(void)proClick{
    [self GZM_Hidden];
    UITextField * protextFile = (UITextField *)[self.view viewWithTag:100];
    UITextField * VersionstextFile = (UITextField *)[self.view viewWithTag:101];
    UITextField * VersionstextFile4 = (UITextField *)[self.view viewWithTag:102];
    UITextField * VersionstextFile1 = (UITextField *)[self.view viewWithTag:110];
    UITextField * VersionstextFile2 = (UITextField *)[self.view viewWithTag:112];
    UITextField * VersionstextFile3 = (UITextField *)[self.view viewWithTag:113];

    if (protextFile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目名称不能为空" WithVc:self];
        return;
    }
    if (VersionstextFile.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目版本号不能为空" WithVc:self];
        return;
    }
    
    if (textView.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"项目描述不能为空" WithVc:self];
        return;
    }
    if ([languageButton.titleLabel.text isEqualToString:@"请选择平台"]) {
        [AlerYangShi tishiWithMessage:@"平台选择不能为空" WithVc:self];
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

    NSDictionary * dic = @{@"token":toketen,@"pname":protextFile.text,@"version":VersionstextFile.text,@"remark":textView.text,@"platformid":platformid,@"effective":@"true",@"projectid":@"",@"trialTime":VersionstextFile4.text,@"invite":yaoqingView1.hidden == NO?@"true":@"false",@"gessday":VersionstextFile1.text.length > 0 ?VersionstextFile1.text:@"0",@"reachDay":VersionstextFile2.text.length > 0 ?VersionstextFile2.text:@"0",@"reachtimes":VersionstextFile3.text.length > 0 ?VersionstextFile3.text:@"0"};
    NSLog(@"%@",dic);
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:CreateProject] parameters:dic successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GZMProjectViewController" object:nil userInfo:nil];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }

    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
    
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
//********激活输入框********
//-(void)GZM_Show{
//    [UIView animateWithDuration:0.25 animations:^{
//        self.MainScrollview.contentOffset = CGPointMake(0, 80);
//    } completion:^(BOOL finished) {
//        
//    }];
//}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.view.y = 0;
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    [self GZMpublic_show];
}
-(void)leftbutton1Click{
    [AlerYangShi creatTitleWith:@"主人离创建成功只有一步了，确定要离开？" creatOneWith:nil withTwoStr:nil WithVc:self withSuccessBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    } withErrorBlock:^{
        
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
