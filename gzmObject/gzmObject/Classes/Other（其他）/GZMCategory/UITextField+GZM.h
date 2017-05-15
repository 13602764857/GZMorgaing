//
//  UITextField+GZM.h
//  gzmObject
//
//  Created by gzm on 2017/5/15.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (GZM)
/*********textFiled的holderText的一些设置*********/
-(void)GZMpublicTextFiledPlacehoderWith:(UIColor *)color withSize:(CGFloat)lableSize WithholderText:(NSString *)holderText Withalignment:(NSTextAlignment)type;
@end
