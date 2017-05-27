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
#import "GZMCreatViewController.h"
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
-(void)rightbutton1Click{
    self.tabBarController.tabBar.hidden = YES;
    GZMCreatViewController * greatVc = [[GZMCreatViewController alloc] init];
    [self.navigationController pushViewController:greatVc animated:YES];
}
/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZmprojectTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64 + 7, Width, Height - 64 - 49 -7);
    self.GZMTableView.rowHeight = 120;
}
-(void)creatData{
    pindex = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:@{@"token":toketen,@"pindex":[NSString stringWithFormat:@"%ld",(long)pindex],@"pagesize":@"10"} successBlock:^(id message) {
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
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:@{@"token":toketen,@"pindex":[NSString stringWithFormat:@"%ld",(long)pindex],@"pagesize":@"10"} successBlock:^(id message) {
        
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
    self.tabBarController.tabBar.hidden = YES;
    GZMdetailProjectViewController * detail = [[GZMdetailProjectViewController alloc] init];
    detail.Projectmodel = mo;
    [self.navigationController pushViewController:detail animated:YES];
    NSDictionary * dic = @{@"token":toketen,@"projectid":mo.ProjectID};
//    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ProjectDetails] parameters:dic successBlock:^(id message) {
//       NSArray * arr =  [GZMProjectModel setModelWithArray:message[@"message"]];
////        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
//        GZMdetailProjectViewController * detail = [[GZMdetailProjectViewController alloc] init];
//        detail.Projectmodel = (GZMProjectModel*)arr[0];
//        [self.navigationController pushViewController:detail animated:YES];
//    } failBlock:^(id message) {
//        
//    } delegate:self loadWith:mainLoading];
    
    
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [AlerYangShi creatTitleWithAndTexifiled:@"请输入密码再删除" creatOneWith:nil withTwoStr:nil WithVc:self withSuccessBlock:^(id str) {
            NSLog(@"%@",str);
            GZMProjectModel * mo = self.GZMDataArr[indexPath.row];
            NSDictionary * dic =@{@"token":toketen,@"projectid":mo.ProjectID,@"effective":@"",@"userpass":str};
            [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:DeleteProject] parameters:dic successBlock:^(id message) {
                if ([message[@"issuccess"] isEqual:@0]) {
                    [AlerYangShi tishiWithMessage:@"密码错误" WithVc:self];
                    return ;
                }
                [self.GZMDataArr removeObject:mo];
                [self.GZMTableView reloadData];
            } failBlock:^(id message) {
                
            } delegate:self loadWith:mainLoading];
        } withErrorBlock:^{
//            [self.GZMTableView reloadData];
        }];
        
        ;
    }];
    return @[deleteRowAction];
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
