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
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock{
    if (self = [super initWithFrame:frame]) {
        _datablock = dataBlock;
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        dataArr1 = dataArr;
        [self addSubview:tableView];
        
    }return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr1.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    self.datablock(dataArr1[indexPath.row][@"LangName"]);
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = dataArr1[indexPath.row][@"LangName"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
