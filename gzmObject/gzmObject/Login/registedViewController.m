//
//  registedViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/16.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "registedViewController.h"

@interface registedViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation registedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_CreatFather];
    // Do any additional setup after loading the view.
}
/*********私有父类的方法*********/
-(void)GZM_CreatFather{
//    self.imageView1.hidden = YES;
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
   
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

-(void)leftbutton1Click{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
