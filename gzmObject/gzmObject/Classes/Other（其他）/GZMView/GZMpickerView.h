//
//  GZMpickerView.h
//  gzmObject
//
//  Created by gzm on 2017/5/31.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSInteger, GZMPicketTpye) {
    PicketTypeOne          =0,
    PicketTypeTwo               = 1 << 0,
    PicketTypeThree               = 1 << 1,
    //    TableViewcellType                 = 1 << 1,
    //    imageAndTitle           = 1 << 2,
    //    onlyTitle               = 1 << 3,
};
typedef void (^DataBlock)(id message);

@interface GZMpickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock;
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock withType:(GZMPicketTpye)type;
/**********<#属性#> ************/
@property(nonatomic,strong)DataBlock datablock;
/**********<#属性#> ************/
@property(nonatomic,strong)UIPickerView * myPickerView;
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * secondData;
/**********<#属性#> ************/
@property(nonatomic,assign)GZMPicketTpye picketType;
@end
