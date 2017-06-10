//
//  GZMequipmentViewController.m
//  gzmObject
//
//  Created by gzm on 2017/5/24.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMequipmentViewController.h"
#import "GZmprojectTableViewCell.h"
#import "GZMEqupmenttionMOdel.h"
#import "GZmEquentTableViewCell.h"
#import "GZMDetailEuimentViewController.h"
#import "AppDelegate.h"
#import "GZMProjectModel.h"
#import "leftButton.h"
#import "tableVIew.h"
#import "GZMpickerView.h"
@interface GZMequipmentViewController ()<UIGestureRecognizerDelegate>

@end

@implementation GZMequipmentViewController
{
    UIView * SearcherView;
    NSArray * projectArr;
    UIButton * trueButton;
    UIButton * falseButton;
    leftButton * languageButton;
    tableVIew * tableview;
    GZMpickerView * MypickerView;
    NSDictionary * Mdic;
    NSString * ProjiectID;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GZMNotReshquipment) name:@"GZMequipmentViewController" object:nil];
    [self GZM_creatFather];
    [self GZM_setTableView];
    [self GZM_CreatSearchView];
    // Do any additional setup after loading the view.
}

-(void)GZMNotReshquipment{
    [self creatData];
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    AppDelegate * delle= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    projectArr = delle.ProjectArr;
    if (projectArr.count > 0) {
        GZMProjectModel * mo = projectArr[0];
        ProjiectID = mo.ProjectID;
    }else{
        ProjiectID = @"0";
    }
    Mdic = @{@"token":toketen,@"projectID":ProjiectID,@"deviceID":@"",@"udid":@"",@"code":@"",@"remark":@"",@"effective":@"",@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":sizePage};
    self.leftbutton1.hidden = YES;
    self.mainlable1.text = @"设备列表";
//    self.rightbutton1.x = Width - 10 - 100;
//    self.rightbutton1.width = 100;
    [self.rightbutton1 setTitle:@"搜索" forState:UIControlStateNormal];
    
}
-(void)leftbutton1Click{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


/*********弹出搜索的表格*********/
-(void)GZM_CreatSearchView{
    
    SearcherView = [[UIView alloc] initWithFrame:self.GZMTableView.frame];
    SearcherView.hidden = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [SearcherView addGestureRecognizer:tap];
    SearcherView.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.2];
    [self.view addSubview:SearcherView];
    
    NSArray * titleArr = @[@"项目名字:",@"设备号:",@"UDID:",@"激活码",@"备注:",@"",@""];
    
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40 * titleArr.count, Width, SearcherView.height - 40 *titleArr.count)];
//    image.backgroundColor = MianColor;
    image.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageViewClick:)];
    [image addGestureRecognizer:tap1];
    [SearcherView addSubview:image];
    NSArray * titleArr1 = @[@"项目名字:",@"请输入设备编号",@"请输入UDID",@"请输入产品激活码",@"请输入备注",@""];
    for (int i = 0; i < titleArr.count; i ++) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, i * 40, Width, 40)];
        view.backgroundColor = [UIColor whiteColor];
        [SearcherView addSubview:view];
        
        UILabel * lineLable = [[UILabel alloc] initWithFrame:CGRectMake(0, view.height - 0.5, Width, 0.5)];
        lineLable.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.2];
        [view addSubview:lineLable];
        
        UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, view.height)];
        lable1.font = [UIFont systemFontOfSize:14];
        lable1.textAlignment = NSTextAlignmentRight;
        lable1.text = titleArr[i];
        [view addSubview:lable1];
        if (i == 0) {
            languageButton = [[leftButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lable1.frame) + 10, 0, 200, view.height)];
            //            languageButton.backgroundColor = [UIColor redColor];
            NSString * str1 = [self creatArr].count?[self creatArr][0]:@"";
            [languageButton setTitle:str1 forState:UIControlStateNormal];
            languageButton.titleLabel.font = [UIFont systemFontOfSize:13];
            [languageButton setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
            [languageButton addTarget:self action:@selector(leftbuttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:languageButton];
        }
        
        if (i > 0 && i < 5) {
            UITextField * textFile = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lable1.frame) + 10, 0, 150, view.height)];
            [textFile GZMpublicTextFiledPlacehoderWith:nil withSize:13 WithholderText: titleArr1[i] Withalignment:NSTextAlignmentLeft];
            textFile.tag = 1000 + i;
//            textFile.placeholder = titleArr1[i];
            [view addSubview:textFile];
        }
        if (i == 5) {
            trueButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, Width/2, view.height)];
            [trueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [trueButton setTitle:@"  有效" forState:UIControlStateNormal];
            [trueButton setImage:[UIImage imageNamed:@"待选"] forState:UIControlStateNormal];
            trueButton.selected = YES;
            
            [trueButton setImage:[UIImage imageNamed:@"选择"] forState:UIControlStateSelected];
            trueButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [trueButton addTarget:self action:@selector(trueClick:) forControlEvents:UIControlEventTouchUpInside];
            
            //                trueButton.backgroundColor = MianColor;
            [view addSubview:trueButton];
            
            falseButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(trueButton.frame) , 0, Width/2, view.height)];
            [falseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           
            falseButton.selected = NO;
           
            [falseButton setTitle:@"  无效" forState:UIControlStateNormal];
            [falseButton setImage:[UIImage imageNamed:@"待选"] forState:UIControlStateNormal];
            [falseButton setImage:[UIImage imageNamed:@"选择"] forState:UIControlStateSelected];
            falseButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [falseButton addTarget:self action:@selector(trueClick:) forControlEvents:UIControlEventTouchUpInside];
            
            //                trueButton.backgroundColor = MianColor;
            [view addSubview:falseButton];
        }
        if ( i == 6) {
            UIButton * SearChbutton =  [[UIButton alloc] initWithFrame:CGRectMake(0, 0, Width, view.height)];
            [SearChbutton addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
            [SearChbutton setTitle:@"搜索" forState:UIControlStateNormal];
            [SearChbutton setTitleColor:MianColor forState:UIControlStateNormal];
            [view addSubview:SearChbutton];
        }
    }
}
/********** 获取name数组************/
-(NSArray *)creatArr{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < projectArr.count; i ++) {
        GZMProjectModel * mo = projectArr[i];
        [arr addObject:mo.ProjectName];
    }
    return arr;

}
/********** 获取ID数组************/
-(NSArray *)creatIDArr{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < projectArr.count; i ++) {
        GZMProjectModel * mo = projectArr[i];
        [arr addObject:mo.ProjectID];
    }
    return arr;
    
}

/********** 选择语言分类点击事件  ************/
-(void)leftbuttonClick:(UIButton *)button{
    [self GZM_Hidden];

    [MypickerView removeFromSuperview];
    MypickerView = [[GZMpickerView alloc] initWithFrame:CGRectMake(0, Height - 250, Width, 250) withArr:[self creatArr] With:^(id message) {
        [languageButton setTitle:message[@"row"] forState:UIControlStateNormal];
         NSArray * arr1 = [self creatIDArr];
        NSInteger num = [[self creatArr] indexOfObject:message[@"row"]];
        ProjiectID = arr1[num];
    } withType:PicketTypeOne];
    [KeyWindow addSubview:MypickerView];
}


/********** 有效无效的选择************/
-(void)trueClick:(UIButton *)button{
    [self GZM_Hidden];
    [MypickerView removeFromSuperview];
    trueButton.selected = NO;
    falseButton.selected = NO;
    button.selected = YES;
}

/*********搜索面点击*********/
-(void)tapClick:(UITapGestureRecognizer *)tap{
    [MypickerView removeFromSuperview];
    [self GZM_Hidden];
    
}
/*********搜索按钮点击*********/
-(void)searchClick:(UIButton *)button{
    UITextField * textFiled1 = [self.view viewWithTag:1001];
    UITextField * textFiled2 = [self.view viewWithTag:1002];
    UITextField * textFiled3 = [self.view viewWithTag:1003];
    UITextField * textFiled4 = [self.view viewWithTag:1004];
    [self rightbutton1Click];
    [self GZM_Hidden];
    Mdic = @{@"token":toketen,@"projectID":ProjiectID,@"deviceID":textFiled1.text,@"udid":textFiled2.text,@"code":textFiled3.text,@"remark":textFiled4.text,@"effective":trueButton.selected?@"true":@"false",@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":sizePage};
    [self creatData];
}
/*********imageView点击*********/
-(void)tapImageViewClick:(UITapGestureRecognizer *)tap{
    [self rightbutton1Click];
    [self GZM_Hidden];
}

-(void)rightbutton1Click{
    [MypickerView removeFromSuperview];
    self.rightbutton1.selected = !self.rightbutton1.selected;
    if (self.rightbutton1.selected) {
        SearcherView.hidden = NO;
    }else{
        SearcherView.hidden = YES;
    }
    
}
/*********tableView的*********/
-(void)GZM_setTableView{

    [self.view addSubview:self.GZMTableView];
    
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZmEquentTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64 , Width, Height - 64 - 49 );
    self.GZMTableView.rowHeight = 60;
}
-(void)creatData{
   self.page = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    NSDictionary *dic = Mdic;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetDeviceList] parameters:dic successBlock:^(id message) {
        [self.GZMTableView.mj_header endRefreshing];
        if ([message[@"issuccess"] isEqual:@1]) {
            self.GZMDataArr = [GZMEqupmenttionMOdel setModelWithArray:message[@"message"]];
           
            
            [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
            self.GZMTableView.dataSource = self;
            
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
    NSDictionary *dic = Mdic;
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetDeviceList] parameters:dic successBlock:^(id message) {
        
        if ([message[@"pageCount"] integerValue] < self.page ) {
            self.GZMTableView.mj_footer.state = MJRefreshStateNoMoreData;
            return ;
        }
        [self.GZMTableView.mj_footer endRefreshing];
        NSMutableArray * tempArray = [GZMEqupmenttionMOdel setModelWithArray:message[@"message"]];
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
    GZmEquentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.mo = self.GZMDataArr[indexPath.row];
    return cell;
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"禁用" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    return @[deleteRowAction];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    self.tabBarController.tabBar.hidden = YES;
    GZMEqupmenttionMOdel * mo = self.GZMDataArr[indexPath.row];
    GZMDetailEuimentViewController * detailEuimentVc = [[GZMDetailEuimentViewController alloc] init];
    detailEuimentVc.Model = mo;
    [self.navigationController pushViewController:detailEuimentVc animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Width, 30)];
    lable.backgroundColor = [UIColor whiteColor];
    lable.textColor = MianColor;
    
    UILabel * lineLable = [[UILabel alloc] initWithFrame:CGRectMake(0, lable.height - 1, Width, 1)];
    lineLable.backgroundColor = [UIColor GZMLightColor];
    [lable addSubview:lineLable];
    
    lable.textAlignment = NSTextAlignmentCenter;
    if (self.GZMDataArr.count != 0) {
        GZMEqupmenttionMOdel * mo = self.GZMDataArr[section];
        lable.text = mo.ProjectName;
    }
    return lable;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GZMequipmentViewController" object:nil];
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
