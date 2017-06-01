//
//  simpleTableVIew.m
//  gzmObject
//
//  Created by gzm on 2017/5/31.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "simpleTableVIew.h"

@implementation simpleTableVIew
{
    NSArray * dataArr1;
}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock{
    if (self = [super initWithFrame:frame]) {
        _datablock = dataBlock;
        dataArr1 = dataArr;
        _mainTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _mainTableview.delegate = self;
        _mainTableview.dataSource = self;
        [self addSubview:_mainTableview];
        
    }return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr1.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.datablock([NSString stringWithFormat:@"%ld",(long)indexPath.row]);
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.imageView.image = [UIImage imageNamed:dataArr1[indexPath.row][@"image"]];
    cell.textLabel.text = dataArr1[indexPath.row][@"text"];
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;

//    cell.imageView.backgroundColor = MianColor;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
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
