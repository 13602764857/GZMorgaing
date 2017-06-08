//
//  GZmHistroyTableViewCell.h
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "activeHistoryModel.h"
@interface GZmHistroyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLbale;
@property (weak, nonatomic) IBOutlet UILabel *numLable;
/**********<#属性#> ************/
@property(nonatomic,strong)activeHistoryModel * mo;
@end
