//
//  GZMIPTableViewCell.h
//  gzmObject
//
//  Created by gzm on 2017/6/13.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZMIPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *oneLable;
@property (weak, nonatomic) IBOutlet UILabel *TwoLable;
@property (weak, nonatomic) IBOutlet UILabel *ThreeLable;
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * dataArr;
@end
