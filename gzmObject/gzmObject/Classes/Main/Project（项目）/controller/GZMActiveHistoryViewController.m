//
//  GZMActiveHistoryViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMActiveHistoryViewController.h"
#import "GZmHistroyTableViewCell.h"
#import "activeHistoryModel.h"
@interface GZMActiveHistoryViewController ()

@end

@implementation GZMActiveHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GZM_creatFather];
    [self creatUI];
    // Do any additional setup after loading the view.
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    self.mainlable1.text = @"历史提取记录";
    
    //    self.sectionType = GroupType;
    
}

/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZmHistroyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64 , Width, Height - 64);
    self.GZMTableView.rowHeight = 60;
}

-(void)creatUI{
    [self GZM_setTableView];
}
-(void)creatData{
    self.page = 1;
    /********** 下啦到底部时让其重新可®以看到 ************/
    NSDictionary * dic = @{@"token":toketen,@"projectID":self.mo.ProjectID,@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":sizePage};
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ExtractHistory] parameters:dic successBlock:^(id message) {
        [self.GZMTableView.mj_header endRefreshing];
        self.GZMTableView.dataSource = self;
        if ([message[@"issuccess"] isEqual:@1]) {
            self.GZMDataArr = [activeHistoryModel setModelWithArray:message[@"message"]];
            
            
            //                [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
            
        }else{
            [self.GZMDataArr removeAllObjects];
        }
        [self.GZMTableView reloadData];
        
        NSLog(@"qweqe");
    } failBlock:^(id message) {
        
        [self.GZMTableView.mj_header endRefreshing];
    } delegate:self loadWith:mainLoading];
    
}

/*********刷新加载跟多*********/
-(void)creatMoreData{
    self.page += 1;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetProjectList] parameters:@{@"token":toketen,@"projectID":self.mo.ProjectID,@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":sizePage} successBlock:^(id message) {
        
        if ([message[@"pageCount"] integerValue] < self.page ) {
            self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
            return ;
        }
        [self.GZMTableView.mj_footer endRefreshing];
        NSMutableArray * tempArray = [activeHistoryModel setModelWithArray:message[@"message"]];
        for (activeHistoryModel *model in tempArray) {
            
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
    GZmHistroyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.mo = self.GZMDataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"提取" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        activeHistoryModel * mo = self.GZMDataArr[indexPath.row];
        [AlerYangShi creatTitleWith:@"是否提取重新提取这条记录" creatOneWith:@"取消" withTwoStr:@"提取" WithVc:self withSuccessBlock:^{
            [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ReExtractCode] parameters:@{@"token":toketen,@"extractID":mo.ExtractID} successBlock:^(id message) {
                if ([message[@"issuccess"] isEqual:@1]) {
                    [self GZM_zhanTie:message[@"message"]];
                }
                
            } failBlock:^(id message) {
                
            } delegate:self loadWith:mainLoading];
        } withErrorBlock:^{
            [self.GZMTableView reloadData];
        }];
    }];
    
    return @[deleteRowAction];
}
/*********复制带粘贴板*********/
-(void)GZM_zhanTie:(NSString *)str{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = str;
    [AlerYangShi showMessage:@"激活码已复制到粘贴板" duration:1.5];
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
