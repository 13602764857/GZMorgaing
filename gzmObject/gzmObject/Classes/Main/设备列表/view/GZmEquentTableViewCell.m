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
    self.projectLable.text = mo.DeviceID;
    self.timeLable.text = mo.CreateDate;
    self.nameLable.text = mo.Remark.length > 0 ? mo.Remark:@"暂无备注";
    self.typeLable.text = [mo.Effective isEqualToString:@"1"]?@"设备正常":@"设备被禁用";
    if ([mo.Effective isEqualToString:@"1"]) {
        self.typeLable.textColor = [UIColor blackColor];
    }else{
        self.typeLable.textColor = [UIColor redColor];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
