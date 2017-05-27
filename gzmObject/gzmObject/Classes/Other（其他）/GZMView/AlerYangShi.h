//
//  AlerYangShi.h
//  GzAgent
//
//  Created by gongzhiming on 16/6/5.
//  Copyright © 2016年 gzcentaline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlerYangShi : NSObject

/******* (有textfiled)确定和返回的双重提示  *******/
+(void)creatTitleWithAndTexifiled:(NSString *)title creatOneWith:(NSString *)oneStr withTwoStr:(NSString *)TwoStr WithVc:(UIViewController *)vc withSuccessBlock:(void (^)(id str))Successblock withErrorBlock:(void (^)(void))Errorblock;
 // 一些提示框的回调   block是返回确定的按钮(只有一个回调)总共有两个按钮
+(void)creatStr1With:(NSString *)title creatStr2With:(NSString *)str2 WithVc:(UIViewController *)vc withBlock:(void(^)(id))block;
/******* 确定和返回的双重提示()  *******/
+(void)creatTitleWith:(NSString *)title creatOneWith:(NSString *)oneStr withTwoStr:(NSString *)TwoStr WithVc:(UIViewController *)vc withSuccessBlock:(void(^)(void))Successblock withErrorBlock:(void(^)(void))Errorblock;
/******* 单纯的提示框不做任何操作  *******/
+(void)tishiWithMessage:(NSString *)messageStr WithVc:(UIViewController *)vc;
/******* 不是提示框属于有浮层在屏幕上几秒会消失  *******/
+(void)showMessage:(NSString *)message duration:(NSTimeInterval)time;
/******* 单纯的提示框但是会有回调看自己要不要操作  *******/
+(void)creatTitleWith:(NSString *)title creatOnlyStrWith:(NSString *)onlyStr WithVc:(UIViewController *)vc withBlock:(void(^)(void))block;
@end
