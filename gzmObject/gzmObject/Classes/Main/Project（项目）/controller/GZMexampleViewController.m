//
//  GZMexampleViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/5.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMexampleViewController.h"

@interface GZMexampleViewController ()

/**********<#属性#> ************/
@property(nonatomic,strong)UITextView * MainTextView;
@end

@implementation GZMexampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self creatData];
    // Do any additional setup after loading the view.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"项目示例";
    [self.view addSubview:self.MainTextView];
//    [self.rightbutton1 setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    
}
-(void)creatData{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GenAPICode] parameters:@{@"platformid":self.model.PlatformID,@"appid":self.model.AppID} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            NSArray * arr = message[@"message"];
            _MainTextView.text = [arr componentsJoinedByString:@"\n"];
        }else{
            _MainTextView.text = message[@"message"];
        }
        
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
-(UITextView *)MainTextView{
    if (!_MainTextView) {
        _MainTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, Width, Height - 64)];
            }
    _MainTextView.editable = NO;
    return _MainTextView;
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
