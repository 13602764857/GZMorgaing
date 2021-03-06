//
//  tableVIew.m
//  gzmObject
//
//  Created by gzm on 2017/5/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "tableVIew.h"

@implementation tableVIew
{
    NSArray * dataArr1;
}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor GZMcolorWithHexString:@"#000000" withalpha:0.4];
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
//        _mainTableView.delegate = self;
        _mainTableView.center = CGPointMake(self.width/2, self.height/2);
        _mainTableView.bounds = CGRectMake(0, 0, Width - 60, 30 + dataArr.count * 40);
        if (dataArr.count < 3) {
            _mainTableView.bounds = CGRectMake(0, 0, Width - 40, 30 + 3 * 40);
        }
        _mainTableView.dataSource = self;
        dataArr1 = dataArr;
        
        [self addSubview:_mainTableView];
        
    }return self;

}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock{
    if (self = [super initWithFrame:frame]) {
        _datablock = dataBlock;
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        dataArr1 = dataArr;
        [self addSubview:_mainTableView];
        
    }return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr1.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    self.datablock(dataArr1[indexPath.row]);
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = dataArr1[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
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
