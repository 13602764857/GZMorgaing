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
#import "GZMActiveHistoryViewController.h"
@interface GZMActivationViewController ()

@end

@implementation GZMActivationViewController
{
    UIImageView * Moreimage;
    NSMutableArray *sectionArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GZMNotReshAction) name:@"GZMActivationViewController" object:nil];
    [self GZM_creatFather];
    [self GZM_setTableView];
    [self GZM_creatMore];
    // Do any additional setup after loading the view.
}
/********** 通知刷新************/
-(void)GZMNotReshAction{
    [self creatData];
}
/*********<#私有方法#>*********/
-(void)GZM_creatFather{
    sectionArr = [NSMutableArray array];
    self.mainlable1.text = @"激活码";
    [self.rightbutton1 setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateNormal];
    //    self.sectionType = GroupType;
    
}

/*********更多的操作*********/
-(void)GZM_creatMore{
    Moreimage = [[UIImageView alloc] initWithFrame:CGRectMake(Width - 100 - 10, 64, 100, 90)];
    Moreimage.hidden = YES;
    //    Moreimage.backgroundColor = MianColor;
    Moreimage.image = [UIImage imageNamed:@"形状-13"];
    Moreimage.userInteractionEnabled = YES;
    [self.view addSubview:Moreimage];
    
    NSArray * titleArr = @[@"生成激活码",@"历史提取记录"];
    for (int i = 0; i < titleArr.count; i ++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 10 + 40 *i, Moreimage.width, 40)];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [Moreimage addSubview:button];
        if (i != titleArr.count - 1) {
            UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(5, button.height - 1, button.width - 10, 1)];
            lable.backgroundColor = [UIColor whiteColor];
            [button addSubview:lable];
            
        }
    }
}

-(void)moreClick:(UIButton *)button{
    [self hiddenClick];
    switch (button.tag) {
        case 100:
        {
            
            GZMCreatActiveViewController * creatActive = [[GZMCreatActiveViewController alloc] init];
            creatActive.Projectmodel = self.Projectmodel;
            [self.navigationController pushViewController:creatActive animated:YES];
        }
            break;
        case 101:
        {
            GZMActiveHistoryViewController * historyVc = [[GZMActiveHistoryViewController alloc] init];
            historyVc.mo = self.Projectmodel;
            [self.navigationController pushViewController:historyVc animated:YES];
        }
            break;
        case 102:
        {
            
        }
            break;
        default:
            break;
    }
    
}

-(void)rightbutton1Click{
    Moreimage.hidden = (self.rightbutton1.selected == YES) ? YES :NO;
    self.rightbutton1.selected = !self.rightbutton1.selected;
}
/*********tableView的*********/
-(void)GZM_setTableView{
    [self.view addSubview:self.GZMTableView];
    
    [self.GZMTableView registerNib:[UINib nibWithNibName:@"GZMActiveTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.GZMTableView.frame = CGRectMake(0, 64, Width, Height - 64);
    self.GZMTableView.rowHeight = 44;
}

-(void)hiddenClick{
    Moreimage.hidden = YES;
    self.rightbutton1.selected = NO;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hiddenClick];
}
/*********分组的标记*********/
-(void)GZM_CreatSectionArr{
    [sectionArr removeAllObjects];
    for (int i = 0; i < self.GZMDataArr.count; i ++) {
        [sectionArr addObject:@"0"];
    }
    
}
-(void)creatData{
    self.page = 1;
    /********** 下啦到底部时让其重新可以看到 ************/
    self.GZMTableView.mj_footer.state = MJRefreshStateIdle;
    NSDictionary * dic = @{@"token":toketen,@"projectID":self.Projectmodel.ProjectID,@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":sizePage,@"status":@"1",@"code":@"",@"deviceID":@"",@"uniqueID":@""};
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetAuthCodeGroup] parameters:dic successBlock:^(id message) {
        self.GZMTableView.dataSource = self;
         [self.GZMTableView.mj_header endRefreshing];
        NSLog(@"%@",message[@"message"]);
        if ([message[@"issuccess"] isEqual:@1]) {
            self.GZMDataArr = [ActiveModel setModelWithArray:message[@"message"]];
            [self GZM_CreatSectionArr];
            //        self.GZMDataArr = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", nil];
           
            
            //        [ZJModelTool createModelWithDictionary:message[@"message"][0] modelName:nil];
            
            
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
    NSDictionary * dic = @{@"token":toketen,@"projectID":self.Projectmodel.ProjectID,@"pindex":[NSString stringWithFormat:@"%ld",(long)self.page],@"pagesize":sizePage,@"status":@"1",@"code":@"",@"deviceID":@"",@"uniqueID":@""};
    
    [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:GetAuthCodeGroup] parameters:dic successBlock:^(id message) {
        
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.mo = self.GZMDataArr[indexPath.section][indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self hiddenClick];
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActiveModel * mo = self.GZMDataArr[indexPath.section][indexPath.row];
    NSString * tiquStr = @"";
    if ([mo.IsExtract isEqualToString:@"1"]) {
        tiquStr = @"已提取";
        UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:tiquStr handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            [AlerYangShi showMessage:@"激活码已经提取" duration:0.5];
        }];
        return @[deleteRowAction];
    }else{
        tiquStr = @"提取";
        UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:tiquStr handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            ActiveModel * mo = self.GZMDataArr[indexPath.section][indexPath.row];
            [AlerYangShi creatTitleWith:@"是否提取激活码" creatOneWith:nil withTwoStr:nil WithVc:self withSuccessBlock:^{
                NSDictionary * dic = @{@"token":toketen,@"authid":mo.AuthID};
                [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ExtractCode] parameters:dic successBlock:^(id message) {
                    if ([message[@"issuccess"] isEqual:@0]) {
                        [AlerYangShi tishiWithMessage:message[@"message"] WithVc:self];
                        return ;
                    }
                    
                    [self GZM_zhanTie:mo.Code];
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
//头部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ActiveModel  * mo;
    NSString * oneStr ;
    NSString * twoStr;
    if (self.GZMDataArr.count != 0) {
        NSArray * arr = self.GZMDataArr[section];
        NSMutableArray * Marr = [NSMutableArray array];
        for (int i = 0; i < arr.count; i ++) {
            ActiveModel * mo = arr[i];
            if ([mo.IsExtract isEqualToString:@"0"]) {
                [Marr addObject:mo];
            }
            oneStr = [NSString stringWithFormat:@"%lu",(unsigned long)Marr.count];
            twoStr = [NSString stringWithFormat:@"%lu",(unsigned long)arr.count];
        }
    }
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 40)];
//    view1.backgroundColor = MianColor;
    
    
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 40)];
    headView.tag = section;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapclick:)];
    [headView addGestureRecognizer:tap];
    headView.backgroundColor = [UIColor whiteColor];
    [view1 addSubview:headView];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headView.frame), Width, 30)];
    [button setTitle:@"批量提取" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.5];
    [button addTarget:self action:@selector(piliangClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 100 + section;
    if (sectionArr.count != 0) {
        if ([sectionArr[section] isEqualToString:@"0"]) {
            
        }else{
            
            [view1 addSubview:button];
        }
        
    }
    
    
    
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 180, 40)];
    if (self.GZMDataArr.count != 0) {
        mo = self.GZMDataArr[section][0];
        lable.text = [@"有效时长：  " stringByAppendingString:[mo.AuthTime stringByAppendingString:@"天"]];
    }
    lable.font = [UIFont systemFontOfSize:16];
    [headView addSubview:lable];
    
    
    UILabel * rightLable = [[UILabel alloc] initWithFrame:CGRectMake(Width - 120, 0, 80, 40)];
    rightLable.font = [UIFont systemFontOfSize:13.3];
    rightLable.textColor = [UIColor GZMcolorWithHexString:@"#3a3a3a"];
    rightLable.text = [NSString stringWithFormat:@"%@/%@",oneStr,twoStr];
    rightLable.textAlignment = NSTextAlignmentRight;
    [headView addSubview:rightLable];
    
    UIImageView * imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(Width - 30, 15, 10, 5)];
    imageView1.image = [UIImage imageNamed:@"down-1"];
    [headView addSubview:imageView1];
    
    [headView GZMchangeStyleWith:0 withborad:0.5 withBoardColor:[UIColor GZMLightColor]];
        return view1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [super tableView:tableView numberOfRowsInSection:section];
    if ([sectionArr[section] isEqualToString:@"0"]) {
        return 0;
    }
    if (self.GZMDataArr.count != 0) {
        NSArray * arr = self.GZMDataArr[section];
        return arr.count?arr.count:0;
    }else{
        return 0;
    }
    
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.GZMDataArr.count?self.GZMDataArr.count:0;
//}

-(void)piliangClick:(UIButton *)button{
    
    NSArray * arr = self.GZMDataArr[button.tag - 100];
    NSMutableArray * Marr = [NSMutableArray array];
    NSString * twoStr;
    NSString * oneStr;
    for (int i = 0; i < arr.count; i ++) {
        ActiveModel * mo = arr[i];
        if ([mo.IsExtract isEqualToString:@"0"]) {
            [Marr addObject:mo];
        }
        oneStr = [NSString stringWithFormat:@"%lu",(unsigned long)Marr.count];
        twoStr = [NSString stringWithFormat:@"%lu",(unsigned long)arr.count];
    }
    
    [AlerYangShi creatTitleWithAndTexifiled:@"请输入提出数量" creatOneWith:nil withTwoStr:@"提取" WithVc:self withSuccessBlock:^(id str) {
        NSString * str1 = str;
        if ([oneStr intValue] < [str1 intValue]) {
            [AlerYangShi creatTitleWith:[NSString stringWithFormat:@"数量最多为%@个，是否重新选择提取？",oneStr] creatOneWith:@"取消" withTwoStr:@"重新提取" WithVc:self withSuccessBlock:^{
                [self piliangClick:button];
            } withErrorBlock:^{
                
            }];
            return ;
        }
        ActiveModel * mo = arr[0];
        NSDictionary * dic1 = @{@"token":toketen,@"projectID":self.Projectmodel.ProjectID,@"day":mo.AuthTime,@"num":str1,@"type":@"2"};
        [RequestTool sendPostAFRequest:[BaseUrl stringByAppendingString:ExtractCodeBatch] parameters:dic1 successBlock:^(id message) {
            [self GZM_zhanTie:message[@"message"]];
            
            [self creatData];
        } failBlock:^(id message) {
            
        } delegate:self loadWith:mainLoading];
    } withErrorBlock:^{
        
    }];
    
}
/*********复制带粘贴板*********/
-(void)GZM_zhanTie:(NSString *)str{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = str;
    [AlerYangShi showMessage:@"激活码已复制到粘贴板" duration:1.5];
}
-(void)tapclick:(UITapGestureRecognizer *)tag{
    [self hiddenClick];
    if ([sectionArr[tag.view.tag] isEqualToString:@"0"]) {
        [sectionArr replaceObjectAtIndex:tag.view.tag withObject:@"1"];
    }else{
        [sectionArr replaceObjectAtIndex:tag.view.tag withObject:@"0"];
    }
    
    [self.GZMTableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSLog(@"heightForHeaderInSection-->%zi",section);
//    if (sectionArr.count != 0) {
//        if ([sectionArr[section] isEqualToString:@"0"]) {
//            return 40;
//        }else{
//            return 70;
//        }
//        
//    }else{
//        return 0;
//    }
    if ([sectionArr[section] isEqualToString:@"0"]) {
        return 40;
    }else{
        return 70;
    }

    
}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"GZMActivationViewController" object:nil];
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
