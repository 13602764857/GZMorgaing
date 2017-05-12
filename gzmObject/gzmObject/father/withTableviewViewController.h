//
//  withTableviewViewController.h
//  AgentTool
//
//  Created by gongzhiming on 17/2/21.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
//没有数据显示的枚举
typedef NS_OPTIONS(NSInteger, empytype) {
    imageTitleNone          =0,
    onlyimage               = 1 << 0,
    onlyTitle               = 1 << 1,
    imageAndTitle           = 1 << 2,
    buttonImage             = 1 << 3,
//    onlyTitle               = 1 << 3,
};
//瀑布流显示的cell的个数
typedef NS_OPTIONS(NSInteger, collType) {
    collTypeone                 =0,
    collTypetwo                 = 1 << 0,
    collTypethree               = 1 << 1,
    collTypefour                = 1 << 2,
    //    onlyTitle               = 1 << 3,
};


@interface withTableviewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UITableView * GZMTableView;
@property(nonatomic,strong)NSMutableArray * GZMDataArr;
/******* 枚举类型  *******/
@property(nonatomic,assign)empytype empytext;
/******* 枚举类型  *******/
@property(nonatomic,assign)collType collType;


/******* 全局的瀑布流  *******/
@property(nonatomic,strong)UICollectionView *GZMCollEctionView;

/******* <#name#>  *******/
@property(nonatomic,strong)NSMutableArray *GZMCollData;


/******* <#name#>  *******/
@property(nonatomic,strong)void(^ImageClick)();


@end
