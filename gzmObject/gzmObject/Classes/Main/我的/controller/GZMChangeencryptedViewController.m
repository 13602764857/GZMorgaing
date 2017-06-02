//
//  GZMChangeencryptedViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMChangeencryptedViewController.h"
#import "GZMpickerView.h"
@interface GZMChangeencryptedViewController ()<UITextFieldDelegate>
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * dataArr;

/**********<#属性#> ************/
@property(nonatomic,strong)GZMpickerView * MYPicketerView;


/**********<#属性#> ************/
@property(nonatomic,strong)NSMutableArray * questionIDArr;
@end

@implementation GZMChangeencryptedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    self.questionIDArr = [NSMutableArray arrayWithArray:@[@"",@"",@""]];
    // Do any additional setup after loading the view from its nib.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"修改密保";
    self.threeTextFiled.delegate = self;
    self.twoTextFiled.delegate = self;
    /********** 密保样式设置************/
    [self.oneButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.twoButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.threeButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.saveButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    
}
- (IBAction)buttonClic:(id)sender {
    [self GZM_Hidden];
    UIButton * button = (UIButton *)sender;
    [_MYPicketerView removeFromSuperview];
    if (!_dataArr) {
        [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:QuestionList] parameters:@{@"":@""} successBlock:^(id message) {
            self.dataArr = message[@"message"];
            _MYPicketerView = [[GZMpickerView alloc]initWithFrame:CGRectMake(0, Height - 200, Width, 200) withArr:[self.dataArr GZMpublicSetArrWithStr:@"SafetyQuestion"] With:^(id message) {
                [button setTitle:message[@"row"] forState:UIControlStateNormal];
                [self.questionIDArr replaceObjectAtIndex:button.tag-100 withObject:[self.dataArr GZMpublicSetStrWith:message[@"row"] andStr:@"SafetyQuestion" getStr:@"QuestionID"]];
            }];
            _MYPicketerView.picketType = PicketTypeOne;
            [self.view addSubview:_MYPicketerView];
            //        [[[UIApplication sharedApplication] keyWindow] addSubview:self.myPickerView];
            //        [self.myPickerView reloadAllComponents];
        } failBlock:^(id message) {
            
        } delegate:self loadWith:mainLoading];
    }else{
        _MYPicketerView = [[GZMpickerView alloc]initWithFrame:CGRectMake(0, Height - 200, Width, 200) withArr:[self.dataArr GZMpublicSetArrWithStr:@"SafetyQuestion"] With:^(id message) {
            [button setTitle:message[@"row"] forState:UIControlStateNormal];
            [self.questionIDArr replaceObjectAtIndex:button.tag-100 withObject:[self.dataArr GZMpublicSetStrWith:message[@"row"] andStr:@"SafetyQuestion" getStr:@"QuestionID"]];
        }];
        _MYPicketerView.picketType = PicketTypeOne;
        [self.view addSubview:_MYPicketerView];
    }
    
}
- (IBAction)saveClick:(id)sender {
    [self GZM_Hidden];
    if (self.oneTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题一答案不能为空" WithVc:self];
        return;
    }
    if (self.twoTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题二答案不能为空" WithVc:self];
        return;
    }
    if (self.threeTextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题三答案不能为空" WithVc:self];
        return;
    }
    if (self.questionIDArr.count != 3) {
        [AlerYangShi tishiWithMessage:@"问题三答案不能为空" WithVc:self];
        return;
    }
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ModifySafety] parameters:@{@"token":toketen,@"encryptToken":self.encryptToken,@"qid1":self.questionIDArr[0],@"answer1":self.oneTextFiled.text,@"qid2":self.questionIDArr[1],@"answer2":self.twoTextFiled.text,@"qid3":self.questionIDArr[2],@"answer3":self.threeTextFiled.text} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqual:@1]) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    [_MYPicketerView removeFromSuperview];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self GZMpublic_show];
}
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    [self GZMpublic_show];
//}
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
