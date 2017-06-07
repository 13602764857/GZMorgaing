//
//  GZMEqupmenttionMOdel.m
//  gzmObject
//
//  Created by gzm on 2017/6/5.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMEqupmenttionMOdel.h"

@implementation GZMEqupmenttionMOdel
+(NSMutableArray *)setModelWithArray:(NSArray *)array{
    NSMutableArray * modelArray = [GZMEqupmenttionMOdel mj_objectArrayWithKeyValuesArray:array];
    
    return modelArray;
}
@end
