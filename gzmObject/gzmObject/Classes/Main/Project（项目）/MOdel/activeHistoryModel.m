//
//  activeHistoryModel.m
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "activeHistoryModel.h"

@implementation activeHistoryModel
+(NSMutableArray *)setModelWithArray:(NSArray *)array{
    NSMutableArray * modelArray = [activeHistoryModel mj_objectArrayWithKeyValuesArray:array];
    
    return modelArray;
    
}

@end
