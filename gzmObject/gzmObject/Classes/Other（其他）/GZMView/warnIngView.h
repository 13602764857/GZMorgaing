//
//  warnIngView.h
//  GzAgent
//
//  Created by gzm on 16/4/18.
//  Copyright © 2016年 gzcentaline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface warnIngView : NSObject
+(void)warnWithstring:(NSString *)str WithVc:(UIViewController *)vc;
//回调需要
-(instancetype)initWithstring:(NSString *)str WithVc:(UIViewController *)vc;
@property (copy,nonatomic) void(^BackBlock)();
@end
