//
//  GZmEquentTableViewCell.h
//  gzmObject
//
//  Created by gzm on 2017/6/5.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZMEqupmenttionMOdel.h"
@interface GZmEquentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *projectLable;
@property (weak, nonatomic) IBOutlet UILabel *typeLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
/**********<#属性#> ************/
@property(nonatomic,strong)GZMEqupmenttionMOdel * mo;
@end
