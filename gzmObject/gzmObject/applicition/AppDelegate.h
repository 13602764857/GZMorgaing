//
//  AppDelegate.h
//  gzmObject
//
//  Created by gzm on 2017/4/25.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,assign)AFNetworkReachabilityStatus reach;
@property float autoSizeScale;
/**********全局的项目属性 ************/
@property(nonatomic,strong)NSArray * ProjectArr;
@end

