//
//  tableVIew.h
//  gzmObject
//
//  Created by gzm on 2017/5/27.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DataBlock)(id message);
@interface tableVIew : UIView<UITableViewDelegate,UITableViewDataSource>
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock;
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr;
/**********<#属性#> ************/
@property(nonatomic,strong)DataBlock datablock;
/**********<#属性#> ************/
@property(nonatomic,strong)UITableView * mainTableView;
@end
