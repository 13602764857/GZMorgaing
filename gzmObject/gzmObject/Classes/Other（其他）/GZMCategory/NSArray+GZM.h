//
//  NSArray+GZM.h
//  AgentTool
//
//  Created by gzm on 17/3/9.
//  Copyright © 2017年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (GZM)
/******* 去掉重复的数组元素且保证有序  *******/
-(NSArray *)GZMrepeation;
/******* 让数组按字典的某一个字段返回一个数组的数组  *******/
-(NSArray *)GZMsetArrayWith:(NSString *)str;
/******* 数组变格式字符串  *******/
-(NSString *)GZMarrayToJson;
@end
