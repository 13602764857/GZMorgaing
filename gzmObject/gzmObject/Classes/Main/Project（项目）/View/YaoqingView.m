//
//  YaoqingView.m
//  gzmObject
//
//  Created by gzm on 2017/6/13.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "YaoqingView.h"

@implementation YaoqingView
{
    NSArray * dataArr;
}
-(instancetype)initWithFrame:(CGRect)frame withDic:(NSArray *)DataDic{
    if (self = [super initWithFrame:frame]) {
        dataArr = DataDic;
        [self creatView];
    }
    return self;
}

-(void)creatView{
    UILabel * lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    lable1.font = [UIFont systemFontOfSize:14];
    lable1.text = @"邀请功能说明：";
    [self addSubview:lable1];
    
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMinX(lable1.frame) + 10, CGRectGetMaxY(lable1.frame) + 5, self.width - 10, 80)];
    textView.textColor = [UIColor GZMcolorWithHexString:@"#717171"];
    textView.editable = NO;
    textView.text = @"1.用户邀请一位好友使用项目，则用户按项目开发者条件增加使用有效，如类递增。\n2.被邀请人需要按照项目开发者的要求（天数，次数）去使用，才能被视为达标，邀请人的有效期才可增加。\n3.用户与被邀请人的IP地址重复不能视为一个有效用户。";
    [self addSubview:textView];
    
    NSArray * titleArr = @[@"邀请人有效期增加：",@"被邀请人达标要求",@"使用时长：",@"使用次数："];
    NSArray * titleArr1 = @[@"天",@"",@"天",@"次"];
    NSArray * titleArr2 = @[@"请输入有效期",@"",@"请输入使用时长",@"请输入使用次数"];
    for (int i = 0; i < titleArr.count; i ++) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textView.frame) + 5 + i * 40, self.width, 40)];
        [self addSubview:view];
        
            UILabel * lable2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, view.width, view.height)];
            lable2.text = titleArr[i];
            lable2.font = [UIFont systemFontOfSize:14];
            [view addSubview:lable2];
        if (i == 1) {
            lable2.textAlignment = NSTextAlignmentCenter;
            lable2.textColor = [UIColor GZMcolorWithHexString:@"#717171"];
        }
            UILabel * lable3 = [[UILabel alloc] initWithFrame:CGRectMake(self.width - 30, 0, 20, view.height)];
            lable3.text = titleArr1[i];
            lable3.font = [UIFont systemFontOfSize:14];
            lable3.textColor = [UIColor GZMTitleColor];
            [view addSubview:lable3];
            
            UITextField * textFile = [[UITextField alloc] initWithFrame:CGRectMake(view.width - 200, 0, 170, view.height)];
            textFile.font = [UIFont systemFontOfSize:14];
            textFile.delegate = self;
            textFile.tag = 110 + i;
            textFile.text = dataArr[i];
            textFile.textAlignment = NSTextAlignmentRight;
        textFile.keyboardType = UIKeyboardTypeNumberPad;
//            textFile.placeholder = @"请输入";
            [textFile GZMpublicTextFiledPlacehoderWith:[UIColor GZMTitleColor] withSize:14 WithholderText:titleArr2[i] Withalignment:NSTextAlignmentCenter];
        if (i != 1) {
            [view addSubview:textFile];
        }
        
        
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, view.height - 1, view.width, 1)];
        lineView.backgroundColor = [UIColor GZMLightColor];
        [view addSubview:lineView];
    }
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"1415");
    self.deleteBookBlock();
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
