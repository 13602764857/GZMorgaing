//
//  GZMpickerView.h
//  gzmObject
//
//  Created by gzm on 2017/5/31.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DataBlock)(id message);
@interface GZMpickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock;
/**********<#属性#> ************/
@property(nonatomic,strong)DataBlock datablock;
/**********<#属性#> ************/
@property(nonatomic,strong)UIPickerView * myPickerView;
/**********<#属性#> ************/
@property(nonatomic,strong)NSArray * secondData;
@end
