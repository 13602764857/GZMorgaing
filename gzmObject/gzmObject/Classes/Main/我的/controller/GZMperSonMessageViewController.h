//
//  GZMperSonMessageViewController.h
//  gzmObject
//
//  Created by gzm on 2017/6/1.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "FatherViewController.h"
#import "UserModel.h"
@interface GZMperSonMessageViewController : FatherViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTExtfiled;
@property (weak, nonatomic) IBOutlet UIImageView *imageImageView;
/**********<#属性#> ************/
@property(nonatomic,strong)UserModel * userMo;
@end
