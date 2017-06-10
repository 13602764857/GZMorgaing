//
//  registedViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/16.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "registedViewController.h"
#import "GZMpickerView.h"
@interface registedViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * dataArr;
@end

@implementation registedViewController
{
    NSInteger num;
    NSString * oneNum;
    NSString * twoNum;
    NSString * threeNum;
    NSInteger  row1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_CreatFather];
    // Do any additional setup after loading the view.
}
-(void)creatButton{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 30)];
    view.backgroundColor = [UIColor GZMcolorWithHexString:@"#f5f5f5"];
    [view GZMchangeStyleWith:1 withborad:1 withBoardColor:[UIColor blackColor]];
    [_pivketView1 addSubview:view];
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 80, 30)];
    //    button1.backgroundColor = [UIColor GZMcolorWithHexString:@"#ededed"];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    //    [button1 GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    button1.tag = 1001;
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"取消" forState:UIControlStateNormal];
    //    button1.backgroundColor = MianColor;
    [view addSubview:button1];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(Width - 100, 0, 80, 30)];
    //    button2.backgroundColor = [UIColor GZMcolorWithHexString:@"#ededed"];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    //    [button2 GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [button2 setTitle:@"确定" forState:UIControlStateNormal];
    button2.tag = 1002;
    //    button2.backgroundColor = MianColor;
    [view addSubview:button2];
}
-(void)button1Click:(UIButton *)button{
    _pivketView1.hidden = YES;
    if (button.tag == 1001) {
        return;
    }
    if (num == 0) {
        [self.oneButton setTitle:self.dataArr[row1][@"SafetyQuestion"] forState:UIControlStateNormal];
        oneNum = [NSString stringWithFormat:@"%@",self.dataArr[row1][@"QuestionID"]];
    }
    if (num == 1) {
        [self.twoButton setTitle:self.dataArr[row1][@"SafetyQuestion"] forState:UIControlStateNormal];
        twoNum = [NSString stringWithFormat:@"%@",self.dataArr[row1][@"QuestionID"]];
    }
    if (num == 2) {
        [self.threeButton setTitle:self.dataArr[row1][@"SafetyQuestion"] forState:UIControlStateNormal];
        threeNum = [NSString stringWithFormat:@"%@",self.dataArr[row1][@"QuestionID"]];
    }

}
-(UIView *)pivketView1{
    if (!_pivketView1) {
        _pivketView1 = [[UIView alloc] initWithFrame:CGRectMake(0, Height - 200, Width, 200)];
        
        _pivketView1.backgroundColor = [UIColor whiteColor];
        
        _myPickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, Width, 170)];
        _myPickerView1.delegate = self;
        //        [self.myPickerView reloadAllComponents];
        _myPickerView1.dataSource = self;
        _myPickerView1.backgroundColor = [UIColor whiteColor];
        [_pivketView1 addSubview:_myPickerView1];
        [self creatButton];
    }
    return _pivketView1;
}
/*********私有父类的方法*********/
-(void)GZM_CreatFather{
//    self.imageView1.hidden = YES;
    
    self.oneanswertextFiled.delegate = self;
    self.TwoanswertextFiled.delegate = self;
    self.threeanswertextFiled.delegate = self;
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.mainScrollView addGestureRecognizer:tap];
    
    self.imageView1.backgroundColor = [UIColor GZMcolorWithHexString:@"#1592ff"];
    self.mainlable1.text = @"账户注册";
     UIImageView * userTExtView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"账户"]];
//    [self.oneButton setTitle:@"1231241412" forState:UIControlStateNormal];
//    [self.oneButton setImage:[UIImage imageNamed:@"账户"] forState:UIControlStateNormal];
//    [self.oneButton GZMlefiRightButton];
    [self.usertextField GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    self.usertextField.leftViewMode = UITextFieldViewModeAlways;
    self.usertextField.leftView = userTExtView;
    
    
    [self.passWordTexield GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    self.passWordTexield.secureTextEntry = YES;
    UIImageView * userTExtView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"密码"]];
    self.passWordTexield.leftViewMode = UITextFieldViewModeAlways;
    self.passWordTexield.leftView = userTExtView1;
    
    [self.twoPasswordTextField GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    self.twoPasswordTextField.secureTextEntry = YES;
    UIImageView * userTExtView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"密码"]];
    self.twoPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.twoPasswordTextField.leftView = userTExtView2;
    
    
    /********** 密保样式设置************/
     [self.oneButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
     [self.twoButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [self.threeButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
     [self.zhuceButton GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    
    
}


- (IBAction)oneClick:(id)sender {
//    UIButton * button = (UIButton *)sender;
    [self.oneButton GZMlefiRightButton];
    [self GZM_Hidden];
}

-(void)tapClick{
    [self GZM_Hidden];
    _pivketView1.hidden = YES;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArr[row][@"SafetyQuestion"];
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArr.count;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%ld",(long)row);
    row1 = row;
}
-(void)leftbutton1Click{
    _pivketView1.hidden = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (IBAction)registered:(id)sender {
    
    if (self.usertextField.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"请输入用户名" WithVc:self];
        return;
    }
    if (self.passWordTexield.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"请输入密码" WithVc:self];
        return;
    }
    if (![self.twoPasswordTextField.text isEqualToString:self.passWordTexield.text]) {
        [AlerYangShi tishiWithMessage:@"两次密码请输入一致" WithVc:self];
        return;
    }
//    if (self.imageTextfield.text.length == 0) {
//        [AlerYangShi tishiWithMessage:@"请输入图形验证码" WithVc:self];
//        return;
//    }
    if (oneNum.length == 0) {
        [AlerYangShi tishiWithMessage:@"密保问题一不能为空" WithVc:self];
        return;
    }
    if (twoNum.length == 0) {
        [AlerYangShi tishiWithMessage:@"密保问题二不能为空" WithVc:self];
        return;
    }

    if (threeNum.length == 0) {
        [AlerYangShi tishiWithMessage:@"密保问题三不能为空" WithVc:self];
        return;
    }

    if (self.oneanswertextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题一答案不能为空" WithVc:self];
        return;
    }
    if (self.TwoanswertextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题二答案不能为空" WithVc:self];
        return;
    }
    if (self.threeanswertextFiled.text.length == 0) {
        [AlerYangShi tishiWithMessage:@"问题三答案不能为空" WithVc:self];
        return;
    }
    
    NSDictionary * dic = @{@"username":self.usertextField.text,@"userpass":self.passWordTexield.text,@"qid1":oneNum,@"answer1":self.oneanswertextFiled.text,@"qid2":twoNum,@"answer2":self.TwoanswertextFiled.text,@"qid3":threeNum,@"answer3":self.threeanswertextFiled.text,@"valicode":@"zzzzzz"};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:Register] parameters:dic successBlock:^(id message) {
        if ([message[@"issuccess"] isEqualToNumber:@0]) {
            
            [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
            return ;
        }
        
    } failBlock:^(id message) {
       
    } delegate:self loadWith:mainLoading];
}


- (IBAction)answerClick:(id)sender {
    
    [self GZM_Hidden];
    
    UIButton * button= (UIButton *)sender;
    NSLog(@"%ld",(long)button.tag);
    num = button.tag - 100;
    if (!_myPickerView1) {
        [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:QuestionList] parameters:@{@"":@""} successBlock:^(id message) {
            self.dataArr = message[@"message"];
            [[[UIApplication sharedApplication] keyWindow] addSubview:self.pivketView1];
            [self.myPickerView1 reloadAllComponents];
        } failBlock:^(id message) {
            
        } delegate:self loadWith:mainLoading];
    }
    
    _pivketView1.hidden = NO;
    switch (button.tag) {
        case 100:
        {
            
        }
            break;
        case 101:
        {
            
        }
            break;
        case 102:
        {
            [self GZMpublic_show];
        }
            break;
        default:
            break;
    }
}

/*********激活输入框*********/
//-(void)GZM_Show{
//    [UIView animateWithDuration:0.25 animations:^{
//        self.mainScrollView.y = -200;
//    } completion:^(BOOL finished) {
//        
//    }];
//}

/*********输入框*********/
//-(void)GZM_Hidden{
//    [UIView animateWithDuration:0.25 animations:^{
//        self.mainScrollView.y = 64;
//        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
//    } completion:^(BOOL finished) {
//        
//    }];
//}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self GZMpublic_show];
    _pivketView1.hidden = YES;
    
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
