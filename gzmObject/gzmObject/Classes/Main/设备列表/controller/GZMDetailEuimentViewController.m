//
//  GZMDetailEuimentViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMDetailEuimentViewController.h"
#import "GZMTableView.h"
@interface GZMDetailEuimentViewController ()<UITextViewDelegate>
/**********<#属性#> ************/
@property(nonatomic,strong)UIScrollView * mainScrollView;
@end

@implementation GZMDetailEuimentViewController
{
    UITextView * mainTextView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self creatUI];
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"设备列表详情";
   
}

-(void)creatUI{
    [self.view addSubview:self.mainScrollView];
//    NSArray * titleArr = @[@"有效时间",@"最后登录地址",@"最后登录IP",@"最后登录时间",@"请求次数",@"UDID",@"是否有效",@"备注"];
    NSArray * titleArr = @[@"设备号(邀请码)",@"UDID",@"有效时间",@"使用次数",@"最后使用时间",@"最近IP地址",@"是否有效",@"备注"];
    NSArray * titleArr1 = @[self.Model.DeviceID,self.Model.UDID,self.Model.ExpireDate,self.Model.Request,self.Model.LastDate,self.Model.LastIP,[self.Model.Effective isEqualToString:@"1"]?@"正常使用":@"禁用",@""];
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < titleArr.count; i ++) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 40 * i, Width, 39.5)];
        view.backgroundColor = [UIColor whiteColor];
        [_mainScrollView addSubview:view];
        
        UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 105, view.height)];
        lable.font = [UIFont systemFontOfSize:14];
        lable.text = titleArr[i];
        [view addSubview:lable];
        
       
        UILabel * lable1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lable.frame) + 20, 0, 180, view.height)];
        lable1.text = titleArr1[i];
        lable1.font = [UIFont systemFontOfSize:13];
        lable1.textColor = [UIColor GZMTitleColor];
        [view addSubview:lable1];
        if (i == 5) {
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, Width - 10, lable1.height)];
            [button addTarget:self action:@selector(moreButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:@"更多" forState:UIControlStateNormal];
            [button setTitleColor:MianColor forState:UIControlStateNormal];
            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [view addSubview:button];
        }
        [arr addObject:view];
    }
    UIView * view = [arr lastObject];
    mainTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(view.frame) + 10, Width - 30, 100)];
    mainTextView.delegate = self;
    mainTextView.text = self.Model.Remark.length > 0?self.Model.Remark:@"暂无备注";
    [_mainScrollView addSubview:mainTextView];
    
    UIButton * lastButton = [[UIButton alloc] initWithFrame:CGRectMake(0, _mainScrollView.height - 50, Width, 50)];
    [lastButton addTarget:self action:@selector(lastButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [lastButton setTitle:@"保存" forState:UIControlStateNormal];
    lastButton.backgroundColor = MianColor;
    [_mainScrollView addSubview:lastButton];
}

-(void)moreButtonClick{
    NSLog(@"q4r");
    GZMTableView * tableView = [[GZMTableView alloc] initWithFrame:self.view.frame withArr:@[@"12",@"12",@"12"]];
//    tableView.
    [self.view addSubview:tableView];
}

-(void)lastButtonClick{
    if ([mainTextView.text isEqualToString:self.Model.Remark]) {
        [AlerYangShi tishiWithMessage:@"请修改备注后再保存" WithVc:self];
        return;
    }
    
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifyRemark] parameters:@{@"token":toketen,@"deviceID":self.Model.DeviceID,@"remark":mainTextView.text} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"GZMequipmentViewController" object:nil];
            [self leftbutton1Click];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}

-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Width, Height - 64)];
        _mainScrollView.backgroundColor = [UIColor GZMLightColor];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapclik)];
        [_mainScrollView addGestureRecognizer:tap];
    }
    return _mainScrollView;
}
-(void)tapclik{
    [self GZM_Hidden];
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    [self GZMpublic_show];
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
