//
//  ActiveModel.m
//  gzmObject
//
//  Created by gzm on 2017/5/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "ActiveModel.h"

@implementation ActiveModel
+(NSMutableArray *)setModelWithArray:(NSArray *)array{
    NSMutableArray * modelArray = [ActiveModel mj_objectArrayWithKeyValuesArray:array];
    
    return modelArray;
}

@end
