//
//  GZMProjectViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/8.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMProjectViewController.h"
#import "GZmprojectTableViewCell.h"
#import "GZMProjectModel.h"
#import "GZMdetailProjectViewController.h"
@interface GZMProjectViewController ()

@end

@implementation GZMProjectViewController
{
    NSInteger  pindex;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    pindex = 1;
    [self GZM_creatFather];
    [self GZM_setTableView];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.leftbutton1.hidden = YES;
    self.mainlable1.text = @"项目中心";
    self.rightbutton1.x = Width - 10 - 100;
    self.rightbutton1.width = 100;
    [self.rightbutton1 setTitle:@"创建项目" forState:UIControlStateNormal];
    
}
-(void)leftbutton1Click{
    [self.navigationController popViewControllerAnimated:YES];
}
/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZmprojectTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64, Width, Height - 64 - 49);
    self.GZMTableView.rowHeight = 120;
}
-(void)creatData{
    pindex = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:@{@"token":toketen,@"pindex":[NSString stringWithFormat:@"%ld",(long)pindex],@"pagesize":@"2"} successBlock:^(id message) {
        self.GZMDataArr = [GZMProjectModel setModelWithArray:message[@"message"]];
        [self.GZMTableView.mj_header endRefreshing];
        
        //        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
        self.GZMTableView.dataSource = self;
        [self.GZMTableView reloadData];
        NSLog(@"qweqe");
    } failBlock:^(id message) {
       
        [self.GZMTableView.mj_header endRefreshing];
    } delegate:self loadWith:mainLoading];
    
}

/*********刷新加载跟多*********/
-(void)creatMoreData{
    pindex += 1;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:@{@"token":toketen,@"pindex":[NSString stringWithFormat:@"%ld",(long)pindex],@"pagesize":@"2"} successBlock:^(id message) {
        
        if ([message[@"pageCount"] integerValue] < pindex ) {
            self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
            return ;
        }
        [self.GZMTableView.mj_footer endRefreshing];
        NSMutableArray * tempArray = [GZMProjectModel setModelWithArray:message[@"message"]];
        for (GZMProjectModel *model in tempArray) {
            
            [self.GZMDataArr addObject:model];
        }

       
        //        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
        self.GZMTableView.dataSource = self;
        [self.GZMTableView reloadData];
        
        NSLog(@"qweqe");
    } failBlock:^(id message) {
        /********** 失败的时候重新请求这个************/
        pindex -= 1;
        [self.GZMTableView.mj_footer endRefreshing];
    } delegate:self loadWith:mainLoading];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GZmprojectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.mo = self.GZMDataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    GZMProjectModel * mo = self.GZMDataArr[indexPath.row];
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ProjectDetails] parameters:@{@"token":toketen,@"projectid":mo.ProjectID} successBlock:^(id message) {
        if ([message[@"issuccess"] isEqualToNumber:@1]) {
            self.tabBarController.tabBar.hidden = YES;
            GZMdetailProjectViewController * detail = [[GZMdetailProjectViewController alloc] init];
            [self.navigationController pushViewController:detail animated:YES];
        }
    } failBlock:^(id message) {
        
    } delegate:self loadWith:mainLoading];
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
