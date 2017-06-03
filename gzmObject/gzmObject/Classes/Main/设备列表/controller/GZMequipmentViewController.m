//
//  GZMequipmentViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMequipmentViewController.h"
#import "GZmprojectTableViewCell.h"
@interface GZMequipmentViewController ()

@end

@implementation GZMequipmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    // Do any additional setup after loading the view.
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
-(void)rightbutton1Click{
    
    
}
/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZmprojectTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64 + 7, Width, Height - 64 - 49 -7);
    self.GZMTableView.rowHeight = 60;
}
-(void)creatData{
   self.page = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    NSDictionary *dic = @{@"token":toketen,@"projectID":@"",@"deviceID":@"",@"udid":@"",@"ip":@"",@"remark":@"",@"effective":@"",@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":@"10"};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:dic successBlock:^(id message) {
//        self.GZMDataArr = [GZMProjectModel setModelWithArray:message[@"message"]];
//        [self.GZMTableView.mj_header endRefreshing];
        
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
    self.page += 1;
    NSDictionary *dic = @{@"token":toketen,@"projectID":@"",@"deviceID":@"",@"udid":@"",@"ip":@"",@"remark":@"",@"effective":@"",@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":@"10"};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetDeviceList] parameters:dic successBlock:^(id message) {
        
        if ([message[@"pageCount"] integerValue] < self.page ) {
            self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
            return ;
        }
        [self.GZMTableView.mj_footer endRefreshing];
//        NSMutableArray * tempArray = [GZMProjectModel setModelWithArray:message[@"message"]];
//        for (GZMProjectModel *model in tempArray) {
//            
//            [self.GZMDataArr addObject:model];
//        }
        
        
        //        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
        self.GZMTableView.dataSource = self;
        [self.GZMTableView reloadData];
        
        NSLog(@"qweqe");
    } failBlock:^(id message) {
        /********** 失败的时候重新请求这个************/
        self.page -= 1;
        [self.GZMTableView.mj_footer endRefreshing];
    } delegate:self loadWith:mainLoading];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GZmprojectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.mo = self.GZMDataArr[indexPath.row];
    return cell;
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
