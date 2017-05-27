//
//  GZMActiveTableViewCell.m
//  gzmObject
//
//  Created by gzm on 2017/5/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMActiveTableViewCell.h"

@implementation GZMActiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setMo:(ActiveModel *)mo{
    self.oneLable.text = mo.Code;
    self.twoLable.text = mo.AuthTime;
    self.ThreeLable.text = [mo.Effective isEqualToString:@"1"]?@"有效":@"无效";
    self.FourLable.text = mo.CreateDate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
