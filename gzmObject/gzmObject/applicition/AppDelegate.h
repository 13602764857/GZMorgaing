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
@end

