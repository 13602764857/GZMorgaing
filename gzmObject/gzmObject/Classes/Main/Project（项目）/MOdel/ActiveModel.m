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
    NSMutableArray * Marr = [NSMutableArray array];
    for (int i = 0; i < array.count; i ++) {
        NSMutableArray * modelArray = [ActiveModel mj_objectArrayWithKeyValuesArray:array[i][@"Codes"]];
        [Marr addObject:modelArray];
    }
    
    
    return Marr;
    
}

@end
