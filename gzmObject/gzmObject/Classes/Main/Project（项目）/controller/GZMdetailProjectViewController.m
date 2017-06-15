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
#import <UShareUI/UShareUI.h>
#import "GZMexampleViewController.h"
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
    
    NSArray * titleArr = @[@"编辑项目",@"查看示例",@"查看激活码"];
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
            [RequestTool sendGetAFRequest:[BaseUrl stringByAppendingString:GetLanguageList] parameters:@{@"":@""} successBlock:^(id message) {
//                self.tabBarController.tabBar.hidden = YES;
                GZMChangeProgectViewController * greatVc = [[GZMChangeProgectViewController alloc] init];
                greatVc.languageArr = message[@"message"];
                greatVc.Projectmodel = self.Projectmodel;
                [self.navigationController pushViewController:greatVc animated:YES];
            } failBlock:^(id message) {
                
            } delegate:self loadWith:mainLoading];

        }
            break;
        case 101:
        {
            GZMexampleViewController * exampleVc = [[GZMexampleViewController alloc] init];
            exampleVc.model = self.Projectmodel;
            [self.navigationController pushViewController:exampleVc animated:YES];
//            [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
//                // 根据获取的platformType确定所选平台进行下一步操作
//                NSLog(@"%ld",(long)platformType);
//                [self shareWebPageToPlatformType:platformType];
////                [self shareWebPageToPlatformType:platformType ];
//            }];
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
    NSArray * titleArr = @[@"项目名称：",@"创建日期：",@"APP ID   ：",@"使用人数：",@"版  本  号：",@"所属平台：",@"项目状态：",@"邀请功能：",@"项目描述："];
    NSArray * dataArr = @[self.Projectmodel.ProjectName,self.Projectmodel.CreateDate,self.Projectmodel.AppID,self.Projectmodel.Count,self.Projectmodel.Versions,self.Projectmodel.PlatformName,[self.Projectmodel.Effective integerValue] == 1 ?@"有效":@"无效",[self.Projectmodel.EnableInvite integerValue] == 1 ?@"开启":@"已关闭",@""];
    for (int i = 0; i < titleArr.count; i ++) {
        UILabel * imageLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 44*i, Width, 0.5)];
        imageLable.backgroundColor = [UIColor GZMLightColor];
        [_MainScrollview addSubview:imageLable];
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(imageLable.frame), 70, 43.5)];
        titleLable.text = titleArr[i];
        titleLable.font = [UIFont systemFontOfSize:13];
        [_MainScrollview addSubview:titleLable];
        
        UILabel *titleLable1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLable.frame), CGRectGetMaxY(imageLable.frame), 250, 43.5)];
        titleLable1.textColor = [UIColor GZMTitleColor];
        titleLable1.text = dataArr[i];
        titleLable1.font = [UIFont systemFontOfSize:13];
        if (i == 2) {
            titleLable1.font = [UIFont systemFontOfSize:12];
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

- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用【友盟+】社会化组件U-Share" descr:@"欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！" thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = @"http://mobile.umeng.com/social";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
//        [self alertWithError:error];
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
