//
//  GZMActiveTableViewCell.h
//  gzmObject
//
//  Created by gzm on 2017/5/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActiveModel.h"
@interface GZMActiveTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *oneLable;
@property (weak, nonatomic) IBOutlet UILabel *twoLable;
@property (weak, nonatomic) IBOutlet UILabel *ThreeLable;
@property (weak, nonatomic) IBOutlet UILabel *FourLable;

/**********<#属性#> ************/
@property(nonatomic,strong)ActiveModel * mo;
@end
