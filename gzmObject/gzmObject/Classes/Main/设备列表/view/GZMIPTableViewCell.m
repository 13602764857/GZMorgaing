//
//  GZMIPTableViewCell.m
//  gzmObject
//
//  Created by gzm on 2017/6/13.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMIPTableViewCell.h"

@implementation GZMIPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setDataArr:(NSArray *)dataArr{
    self.TwoLable.text = [NSString stringWithFormat:@"%@  (%@)",dataArr[0],dataArr[2]];
    self.ThreeLable.text = dataArr[1];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
