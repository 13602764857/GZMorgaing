//
//  GZmprojectTableViewCell.m
//  gzmObject
//
//  Created by gzm on 2017/5/10.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZmprojectTableViewCell.h"

@implementation GZmprojectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setMo:(GZMProjectModel *)mo{
    self.onelable.text = mo.ProjectName;
    self.twoLable.text = mo.PlatformName;
    if ([mo.Effective integerValue] == 1) {
        self.threeLable.text = @"有效";
    }else{
        self.threeLable.text = @"无效";
    }
    self.fourLable.text = mo.Versions;
    self.fiveLable.text = mo.Count;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
