//
//  GZMMeActiveViewController.m
//  gzmObject
//
//  Created by gzm on 2017/6/15.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMMeActiveViewController.h"
#import "ActiveModel.h"
#import "GZMActiveTableViewCell.h"
@interface GZMMeActiveViewController ()

@end

@implementation GZMMeActiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    [self creatFather];
    // Do any additional setup after loading the view.
}

-(void)creatFather{
    self.mainlable1.text = @"激活码";
}

-(void)creatUI{
     [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZMActiveTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.GZMTableView];
    self.GZMTableView.frame = CGRectMake(0, 64, Width, Height - 64);
    
}
-(void)creatData{
    self.page = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    NSDictionary * dic = @{@"token":toketen,@"deviceID":self.deviceID};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetDeviceCode] parameters:dic successBlock:^(id message) {
        self.GZMTableView.dataSource = self;
        [self.GZMTableView.mj_header endRefreshing];
        NSLog(@"%@",message[@"message"]);
        if ([message[@"issuccess"] isEqual:@1]) {
            self.GZMDataArr = [ActiveModel mj_objectArrayWithKeyValuesArray:message[@"message"]];
    
            [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
            
            
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
    self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
//    self.page += 1;
//    NSDictionary * dic = @{@"token":toketen,@"deviceID":self.deviceID};
//    
//    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetDeviceCode] parameters:dic successBlock:^(id message) {
//        
//        if ([message[@"pageCount"] integerValue] < self.page ) {
//            self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
//            return ;
//        }
//        [self.GZMTableView.mj_footer endRefreshing];
//        NSMutableArray * tempArray =  [ActiveModel mj_objectArrayWithKeyValuesArray:message[@"message"]];
//        for (ActiveModel *model in tempArray) {
//            
//            [self.GZMDataArr addObject:model];
//        }
//        
//        
//        //        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
//        self.GZMTableView.dataSource = self;
//        [self.GZMTableView reloadData];
//        
//        NSLog(@"qweqe");
//    } failBlock:^(id message) {
//        /********** 失败的时候重新请求这个************/
//        self.page -= 1;
//        [self.GZMTableView.mj_footer endRefreshing];
//    } delegate:self loadWith:mainLoading];


}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActiveModel * mo = self.GZMDataArr[indexPath.row];
    NSString * tiquStr = @"";
    if ([mo.Status isEqualToString:@"2"]) {
        tiquStr = @"已停用";
        UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:tiquStr handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            [AlerYangShi showMessage:@"激活码已经停用" duration:0.5];
        }];
        return @[deleteRowAction];
    }else{
        tiquStr = @"停用";
        if ([mo.CanBlock isEqualToString:@"1"]) {
            
        }else{
            tiquStr = @"已过期";
        }
        UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:tiquStr handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            if ([tiquStr isEqualToString:@"已过期"]) {
                [AlerYangShi showMessage:@"激活码已过期" duration:0.5];
                return ;
            }
            
            [AlerYangShi creatTitleWith:@"是否停用激活码" creatOneWith:nil withTwoStr:nil WithVc:self withSuccessBlock:^{
                NSDictionary * dic = @{@"token":toketen,@"authid":mo.AuthID};
                [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:BlockCode] parameters:dic successBlock:^(id message) {
                    [self creatData];
                } failBlock:^(id message) {
                    
                } delegate:self loadWith:mainLoading];
                
            } withErrorBlock:^{
                //            [self.GZMTableView reloadData];
            }];
        }];
        return @[deleteRowAction];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GZMActiveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.mo1 = self.GZMDataArr[indexPath.row];
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
