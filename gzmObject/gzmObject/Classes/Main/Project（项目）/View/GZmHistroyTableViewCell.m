//
//  GZmHistroyTableViewCell.m
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZmHistroyTableViewCell.h"

@implementation GZmHistroyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setMo:(activeHistoryModel *)mo{
    self.nameLable.text = mo.File;
    self.timeLbale.text = mo.ExtractTime;
    self.numLable.text = mo.Num;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
