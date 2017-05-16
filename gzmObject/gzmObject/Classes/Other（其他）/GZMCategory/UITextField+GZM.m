//
//  UITextField+GZM.m
//  gzmObject
//
//  Created by gzm on 2017/5/15.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "UITextField+GZM.h"

@implementation UITextField (GZM)
/*********textFiled的holderText的一些设置*********/
-(void)GZMpublicTextFiledPlacehoderWith:(UIColor *)color withSize:(CGFloat)lableSize WithholderText:(NSString *)holderText Withalignment:(NSTextAlignment)type{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = type;
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:holderText attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:lableSize], NSParagraphStyleAttributeName:style}];
    self.attributedPlaceholder = attri;
}

@end
