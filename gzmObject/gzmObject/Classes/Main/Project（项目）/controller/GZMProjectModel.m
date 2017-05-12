//
//  GZMProjectModel.m
//  gzmObject
//
//  Created by gzm on 2017/5/9.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMProjectModel.h"

@implementation GZMProjectModel
+(NSMutableArray *)setModelWithArray:(NSArray *)array{
    NSMutableArray * modelArray = [GZMProjectModel mj_objectArrayWithKeyValuesArray:array];
    
    return modelArray;
}

@end
