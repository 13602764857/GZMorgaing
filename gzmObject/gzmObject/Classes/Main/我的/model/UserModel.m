//
//  UserModel.m
//  gzmObject
//
//  Created by gzm on 2017/6/2.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
+(NSMutableArray *)setModelWithArray:(NSArray *)array{
    NSMutableArray * modelArray = [UserModel mj_objectArrayWithKeyValuesArray:array];
    
    return modelArray;
}

@end
