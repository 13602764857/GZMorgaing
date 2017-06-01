//
//  GZMChangeProgectViewController.h
//  gzmObject
//
//  Created by gzm on 2017/5/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "FatherViewController.h"
#import "GZMProjectModel.h"
@interface GZMChangeProgectViewController : FatherViewController
/**********<#属性#> ************/
@property(nonatomic,strong)GZMProjectModel * Projectmodel;
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * languageArr;
@end

