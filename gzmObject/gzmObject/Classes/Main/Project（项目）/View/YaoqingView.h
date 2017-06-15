//
//  YaoqingView.h
//  gzmObject
//
//  Created by gzm on 2017/6/13.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YaoqingView : UIView<UITextFieldDelegate>
-(instancetype)initWithFrame:(CGRect)frame withDic:(NSArray *)DataDic;
/****block ******************/
@property(nonatomic, strong) void(^deleteBookBlock)();
@end
