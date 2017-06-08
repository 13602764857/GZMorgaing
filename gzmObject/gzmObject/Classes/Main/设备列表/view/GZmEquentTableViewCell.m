//
//  GZmEquentTableViewCell.m
//  gzmObject
//
//  Created by gzm on 2017/6/5.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZmEquentTableViewCell.h"

@implementation GZmEquentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setMo:(GZMEqupmenttionMOdel *)mo{
    self.timeLable.text = mo.CreateDate;
    self.nameLable.text = mo.Remark.length > 0 ? mo.Remark:@"暂无备注";
    self.typeLable.text = [mo.Effective isEqualToString:@"1"]?@"正常":@"禁用";
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
