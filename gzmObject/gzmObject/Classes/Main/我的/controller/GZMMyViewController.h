//
//  GZMMyViewController.h
//  gzmObject
//
//  Created by gzm on 2017/4/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FatherViewController.h"
@interface GZMMyViewController : FatherViewController
@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *TwoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ThreeImageView;
@property (weak, nonatomic) IBOutlet UILabel *oneLable;
@property (weak, nonatomic) IBOutlet UILabel *twoLable;
@property (weak, nonatomic) IBOutlet UILabel *threeLable;
@property (weak, nonatomic) IBOutlet UIImageView *nameImageView;
@property (weak, nonatomic) IBOutlet UILabel *NickNameLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@end
