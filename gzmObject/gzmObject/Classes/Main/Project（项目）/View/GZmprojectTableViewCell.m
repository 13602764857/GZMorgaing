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
//    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:mo.Image] placeholderImage:[UIImage imageNamed:@"密码"] options:nil];
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:mo.Image] placeholderImage:nil];
//    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:@"https://baike.baidu.com/pic/图片/372416/0/29381f30e924b899c83ff41c6d061d950a7bf697?fr=lemma&ct=single#aid=0&pic=29381f30e924b899c83ff41c6d061d950a7bf697"] placeholderImage:[UIImage imageNamed:@"密码"]];
//    _bigImageView.image = [UIImage imageWithData:[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:@"https://baike.baidu.com/pic/图片/372416/0/29381f30e924b899c83ff41c6d061d950a7bf697?fr=lemma&ct=single#aid=0&pic=29381f30e924b899c83ff41c6d061d950a7bf697"]]];
//    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:[mo.Image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"%@",error);
//        NSLog(@"%@",image);
//        NSLog(@"%ld",(long)cacheType);
//    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
