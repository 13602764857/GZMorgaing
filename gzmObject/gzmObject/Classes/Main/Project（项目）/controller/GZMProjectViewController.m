//
//  GZMProjectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/8.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMProjectViewController.h"
#import "GZmprojectTableViewCell.h"
@interface GZMProjectViewController ()

@end

@implementation GZMProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_setTableView];
    // Do any additional setup after loading the view.
}
-(void)leftbutton1Click{
    [self.navigationController popViewControllerAnimated:YES];
}
/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZmprojectTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64, Width, Height - 64);
    self.GZMTableView.rowHeight = 120;
}
-(void)creatData{
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:@{@"token":toketen,@"pindex":@"1",@"pagesize":@"100"} successBlock:^(id message) {
        [self.GZMTableView.mj_header endRefreshing];
        self.GZMDataArr = @[@"13",@"",@"",@""];
        self.GZMTableView.dataSource = self;
        [self.GZMTableView reloadData];
        NSLog(@"qweqe");
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GZmprojectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
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
