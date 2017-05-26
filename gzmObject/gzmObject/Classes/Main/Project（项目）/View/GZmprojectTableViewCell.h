//
//  GZmprojectTableViewCell.h
//  gzmObject
//
//  Created by gzm on 2017/5/10.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZMProjectModel.h"
@interface GZmprojectTableViewCell : UITableViewCell
/**********模型 ************/
@property(nonatomic,strong)GZMProjectModel * mo;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UILabel *twoLable;
@property (weak, nonatomic) IBOutlet UILabel *onelable;
@property (weak, nonatomic) IBOutlet UILabel *threeLable;
@property (weak, nonatomic) IBOutlet UILabel *fourLable;
@property (weak, nonatomic) IBOutlet UILabel *fiveLable;
@end
