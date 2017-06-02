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
/*********数组处理后返回需要的数组*********/
-(NSArray *)GZMpublicSetArrWithStr:(NSString *)str;
/*********穿进来一个字符串得到数组的相映的字符串*********/
-(NSString *)GZMpublicSetStrWith:(NSString *)str andStr:(NSString *)str1 getStr:(NSString *)str2;
/*********穿进来一个字符串得到数组的相映的字符串*********/
//-(NSString *)GZMpublicSetStrWith:(NSString *)str getStr:(NSString *)str2;
@end
