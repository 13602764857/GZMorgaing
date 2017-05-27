//
//  GZMActivationViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMActivationViewController.h"
#import "GZMActiveTableViewCell.h"
#import "GZMCreatActiveViewController.h"
#import "ActiveModel.h"
@interface GZMActivationViewController ()

@end

@implementation GZMActivationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self GZM_setTableView];
    // Do any additional setup after loading the view.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"激活码";
    self.rightbutton1.width = 90;
    self.rightbutton1.x = Width - self.rightbutton1.width - 5;
    [self.rightbutton1 setTitle:@"生成激活码" forState:UIControlStateNormal];
}
-(void)rightbutton1Click{
    GZMCreatActiveViewController * creatActive = [[GZMCreatActiveViewController alloc] init];
    creatActive.Projectmodel = self.Projectmodel;
    [self.navigationController pushViewController:creatActive animated:YES];
}
/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZMActiveTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64 + 7, Width, Height - 64 - 7);
    self.GZMTableView.rowHeight = 110;
}
-(void)creatData{
    self.page = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    NSDictionary * dic = @{@"token":toketen,@"projectID":self.Projectmodel.ProjectID,@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":@"10",@"effective":@"true",@"code":@"",@"deviceID":@"",@"uniqueID":@""};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetAuthCodeList] parameters:dic successBlock:^(id message) {
        self.GZMDataArr = [ActiveModel setModelWithArray:message[@"message"]];
        NSLog(@"%@",message[@"message"]);
//        self.GZMDataArr = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", nil];
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
    self.page += 1;
    NSDictionary * dic = @{@"token":toketen,@"projectID":self.Projectmodel.ProjectID,@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":@"10",@"effective":@"true",@"code":@"",@"deviceID":@"",@"uniqueID":@""};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetAuthCodeList] parameters:dic successBlock:^(id message) {
        
        if ([message[@"pageCount"] integerValue] < self.page ) {
            self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
            return ;
        }
        [self.GZMTableView.mj_footer endRefreshing];
        NSMutableArray * tempArray = [ActiveModel setModelWithArray:message[@"message"]];
        for (GZMProjectModel *model in tempArray) {
            
            [self.GZMDataArr addObject:model];
        }
        
        
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
    GZMActiveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.mo = self.GZMDataArr[indexPath.row];
    return cell;
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"丢弃" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        ActiveModel * mo = self.GZMDataArr[indexPath.row];
        [AlerYangShi creatTitleWith:@"是否丢弃激活码" creatOneWith:nil withTwoStr:nil WithVc:self withSuccessBlock:^{
            NSDictionary * dic = @{@"token":toketen,@"authid":mo.AuthID};
            [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:DiscardCode] parameters:dic successBlock:^(id message) {
                if ([message[@"issuccess"] isEqual:@0]) {
                    [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
                    return ;
                }
                [self.GZMDataArr removeObject:mo];
                [self.GZMTableView reloadData];
            } failBlock:^(id message) {
                
            } delegate:self loadWith:mainLoading];
            
        } withErrorBlock:^{
//            [self.GZMTableView reloadData];
        }];
    }];
    return @[deleteRowAction];
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
