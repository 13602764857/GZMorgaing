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
    self.twoLable.text = [mo.AuthTime stringByAppendingString:@" 天"];
    self.ThreeLable.text = [mo.IsExtract isEqualToString:@"1"]?@"已提取":@"";
    self.FourLable.text = mo.CreateDate;
}
-(void)setMo1:(ActiveModel *)mo1{
    self.oneLable.text = mo1.Code;
    self.twoLable.text = [mo1.AuthTime stringByAppendingString:@" 天"];
    self.ThreeLable.text = [mo1.Status isEqualToString:@"2"]?@"已经停用":@"";
    
    self.ThreeLable.text = ![mo1.CanBlock isEqualToString:@"1"]?@"已经过期":self.ThreeLable.text;
    
    self.FourLable.text = mo1.CreateDate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
