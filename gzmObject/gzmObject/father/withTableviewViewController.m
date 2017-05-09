//
//  withTableviewViewController.m
//  AgentTool
//
//  Created by gongzhiming on 17/2/21.
//  Copyright © 2017年 test. All rights reserved.
//

#import "withTableviewViewController.h"
@interface withTableviewViewController ()

/******* empy  *******/
@property(nonatomic,strong)UIView *empyView;


@end

@implementation withTableviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.empytext = onlyTitle;
    self.collType = collTypetwo;
    // Do any additional setup after loading the view.
}
/******* <#name#>  *******/
-(UIView *)empyView{
    if (!_empyView) {
        _empyView = [[UIView alloc] init];
//        _empyView.center = (_GZMTableView?_GZMTableView:_GZMCollEctionView).center;
        _empyView.frame = CGRectMake(0, 0, Width, (_GZMTableView?_GZMTableView:_GZMCollEctionView).height);
        [(_GZMTableView?_GZMTableView:_GZMCollEctionView) addSubview:_empyView];
        switch (_empytext) {
            case imageTitleNone:
            {
                
            }
                break;
            case onlyimage:
            {
                UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_selet"]];
                imageView.center = CGPointMake(_empyView.width/2, _empyView.height/2);
                [_empyView addSubview:imageView];
            }
                break;
            case onlyTitle:
            {
                UILabel * titleLable1 = [[UILabel alloc]init];
                titleLable1.center = CGPointMake(_empyView.width/2 , _empyView.height/2);
                titleLable1.bounds = CGRectMake(0, 0, 200, 20);
                titleLable1.textAlignment = NSTextAlignmentCenter;
                titleLable1.textColor = [UIColor GZMLightColor];
                titleLable1.text = @"主人暂无数据哟~~";
                [_empyView addSubview:titleLable1];
                
                
                NSLog(@"%f%f",titleLable1.center.x,titleLable1.center.y);
            }
                break;
            case imageAndTitle:
            {
                UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_360"]];
                imageView.center = CGPointMake(_empyView.width/2, _empyView.height/2 - 30);
                [_empyView addSubview:imageView];
                
                UILabel * titleLable1 = [[UILabel alloc]init];
                titleLable1.center = CGPointMake(_empyView.width/2 , _empyView.height/2);
                titleLable1.bounds = CGRectMake(0, 0, 200, 20);
                titleLable1.y = CGRectGetMaxY(imageView.frame) + 10;
                titleLable1.textAlignment = NSTextAlignmentCenter;
                titleLable1.textColor = [UIColor GZMLightColor];
                titleLable1.text = @"主人暂无数据哟~~";
                [_empyView addSubview:titleLable1];
            }
                break;
            case buttonImage:
            {
                UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"委托.jpg"]];
                imageView.userInteractionEnabled = YES;
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
                [imageView addGestureRecognizer:tap];
                imageView.center = CGPointMake(_empyView.width/2, _empyView.height/2 - 20);
                
                [_empyView addSubview:imageView];
                
                
                
            }
                break;

            default:
                break;
        }
        _empyView.backgroundColor = [UIColor whiteColor];
        _empyView.hidden = YES;
    }
    return _empyView;
}


-(void)tapClick{
    _ImageClick();
}


-(UITableView *)GZMTableView{
    if (!_GZMTableView) {
        _GZMTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _GZMTableView.delegate = self;
//        _GZMTableView.dataSource = self;
        
        _GZMTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(creatData)];
        [_GZMTableView.mj_header beginRefreshing];
        _GZMTableView.backgroundColor = [UIColor whiteColor];
        _GZMTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
       
    }
    return _GZMTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"qar2r2");
    if (self.GZMDataArr.count == 0) {
        if (tableView) {
            self.empyView.hidden = NO;
        }
    }else{
        self.empyView.hidden = YES;
    }
    
    return self.GZMDataArr.count?self.GZMDataArr.count:0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}






/******* 此处为界限  *******/
-(UICollectionView *)GZMCollEctionView{
    if (!_GZMCollEctionView) {
        UICollectionViewFlowLayout * FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        switch (_collType) {
            case collTypethree:
            {
                FlowLayout.itemSize = CGSizeMake(165 * FITNUM, 150 * FITNUM);
            }
                break;
            case collTypetwo:
            {
                FlowLayout.itemSize = CGSizeMake(165 * FITNUM, 150 * FITNUM);
            }
                break;
                
            default:
                break;
        }
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 50, 10);
        FlowLayout.minimumInteritemSpacing = 8;
        FlowLayout.minimumLineSpacing = 17;
        _GZMCollEctionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Width, self.view.height) collectionViewLayout:FlowLayout];
        
//        _GZMCollEctionView.dataSource = self;
        _GZMCollEctionView.backgroundColor = [UIColor whiteColor];
        _GZMCollEctionView.delegate = self;
        
        _GZMCollEctionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(creatData)];
        [_GZMCollEctionView.mj_header beginRefreshing];
    }
    return _GZMCollEctionView;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.GZMCollData.count == 0) {
        if (collectionView) {
            self.empyView.hidden = NO;
        }
    }else{
        self.empyView.hidden = YES;
    }
    
    return self.GZMCollData.count?self.GZMCollData.count:0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
