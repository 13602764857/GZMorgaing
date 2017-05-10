//
//  GZMCAtegory.h
//  gzmObject
//
//  Created by gzm on 2017/4/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#ifndef GZMCAtegory_h
#define GZMCAtegory_h
#import "UIColor+GZM.h"
#import "NSString+GZM.h"
//请求加载动画枚举
typedef NS_OPTIONS(NSInteger, loadIngtype) {
    mainLoading          =0,
    cilyLoag               = 1 << 0,
    lineLoag                = 1 << 1,
    //    imageAndTitle           = 1 << 2,
    //    onlyTitle               = 1 << 3,
};

#endif /* GZMCAtegory_h */
