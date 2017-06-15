//
//  GZMTableView.m
//  gzmObject
//
//  Created by gzm on 2017/6/13.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMTableView.h"
#import "GZMIPTableViewCell.h"
@implementation GZMTableView
{
    NSArray * dataArr1;
}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.4];
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
                _mainTableView.delegate = self;
        _mainTableView.center = CGPointMake(self.width/2, self.height/2);
        _mainTableView.bounds = CGRectMake(0, 0, Width - 60, 30 + dataArr.count * 40);
        if (dataArr.count < 3) {
            _mainTableView.bounds = CGRectMake(0, 0, Width - 40, 30 + 3 * 40);
        }
        _mainTableView.dataSource = self;
        dataArr1 = dataArr;
        [_mainTableView GZMchangeStyleWith:8 withborad:1 withBoardColor:[UIColor whiteColor]];
        _mainTableView.bounces = NO;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_mainTableView registerNib:[UINib nibWithNibName:@"GZMIPTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        [self addSubview:_mainTableView];
        
    }return self;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton * button = [[UIButton alloc] init];
    [button setTitle:@"最近IP地址" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button GZMchangeStyleWith:0 withborad:0.5 withBoardColor:[UIColor GZMTitleColor]];
    button.backgroundColor = [UIColor GZMLightColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return button;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.4];
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
                _mainTableView.delegate = self;
        
        _mainTableView.center = CGPointMake(self.width/2, self.height/2);
        _mainTableView.bounds = CGRectMake(0, 0, Width - 60, 30 + dataArr.count * 45);
        if (dataArr.count < 3) {
            _mainTableView.bounds = CGRectMake(0, 0, Width - 40, 30 + 3 * 45);
        }
        _mainTableView.dataSource = self;
        dataArr1 = dataArr;
        [self addSubview:_mainTableView];
        
        
    }return self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr1.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

//    self.datablock(dataArr1[indexPath.row])
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    GZMIPTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.dataArr = dataArr1[indexPath.row];
    cell.oneLable.text = [NSString stringWithFormat:@"%ld%@",(long)indexPath.row + 1,@"."];
    return cell;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
