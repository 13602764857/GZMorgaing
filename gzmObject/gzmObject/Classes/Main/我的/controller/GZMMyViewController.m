//
//  GZMMyViewController.m
//  gzmObject
//
//  Created by gzm on 2017/4/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMMyViewController.h"
#import "GZmSettingViewController.h"
#import "UserModel.h"
#import "simpleTableVIew.h"
@interface GZMMyViewController ()

@end

@implementation GZMMyViewController
{
    UserModel * useModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
-(void)creatData{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetAuthorInfo] parameters:@{@"token":toketen} successBlock:^(id message) {
//        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
        NSArray * data = [UserModel setModelWithArray:message[@"message"]];
        useModel = (UserModel *)data[0];
        self.NickNameLable.text = useModel.NickName;
        self.oneLable.text = useModel.ProjectCount;
        self.twoLable.text = useModel.UserCount;
        [self.nameImageView sd_setImageWithURL:[NSURL URLWithString:useModel.ULogo] placeholderImage:nil];
        self.timeLable.text = [@"最近登录：" stringByAppendingString:useModel.LoginHistory];
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
-(void)GZMNotReshMy{
    [self creatData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GZMNotReshMy) name:@"GZMMyViewController" object:nil];
    self.navigationController.navigationBarHidden = YES;
    self.imageView1.hidden = YES;
    [self.nameImageView GZMchangeStyleWith:self.nameImageView.width/2 withborad:0 withBoardColor:nil];
    
    self.view.backgroundColor = [UIColor GZMLightColor];
    [self creatData];
    [self creatUI];
    // Do any additional setup after loading the view.
}
-(void)creatUI{
    NSArray * arr = @[@{@"image":@"",@"text":@"项目管理"},@{@"image":@"",@"text":@"项目管理"}];
    simpleTableVIew *simple = [[simpleTableVIew alloc] initWithFrame:CGRectMake(0, self.imageHeight.constant + 10, Width, 50 *arr.count) withArr:arr With:^(id message) {
        NSInteger num = [message integerValue];
        switch (num) {
            case 0:
            {
                self.tabBarController.selectedIndex = 0;
            }
                break;
            case 1:
            {
                self.tabBarController.selectedIndex = 0;
            }
                break;
            default:
                break;
        }
    }];
    simple.mainTableview.rowHeight = 50;
    simple.mainTableview.scrollEnabled = NO;
    [self.view addSubview:simple];

}
- (IBAction)setButtonClick:(id)sender {
    self.tabBarController.tabBar.hidden = YES;
    GZmSettingViewController * set = [[GZmSettingViewController alloc] init];
    set.userMo = useModel;
    [self.navigationController pushViewController:set animated:YES];
}
- (IBAction)messageClick:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GZMMyViewController" object:nil];
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
