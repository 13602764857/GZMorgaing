//
//  NSArray+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/9.
//  Copyright © 2017年 test. All rights reserved.
//

#import "NSArray+GZM.h"

@implementation NSArray (GZM)
/******* 去掉重复的数组元素且保证有序  *******/
-(NSArray *)GZMrepeation{
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < [self count]; i++){
        if ([categoryArray containsObject:[self objectAtIndex:i]] == NO){
            [categoryArray addObject:[self objectAtIndex:i]];
        }
        
    }
    return categoryArray;
}

/******* 让数组按字典的某一个字段返回一个数组的数组  *******/
-(NSArray *)GZMsetArrayWith:(NSString *)str{
    NSMutableArray * dataArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.count; i++) {
        NSMutableArray * arr = [NSMutableArray array];
        NSDictionary * dic = self[i];
        NSString * iTime = dic[str];
        for(NSInteger j = i ; j < self.count; j++){
            NSString * jTime = self[j][str];
            i = j - 1;
            if([iTime isEqualToString:jTime]){
                [arr addObject:self[j]];
                if(j == self.count - 1){
                    i = self.count;
                }
            }else{
                break;
            }
        }
        if(arr.count != 0){
            [dataArray addObject:arr];
        }
    }
    
    NSMutableArray *mArr = [[NSMutableArray alloc] init];
    for (NSInteger i = dataArray.count - 1; i >= 0 ; i --) {
        [mArr addObject:dataArray[i]];
    }
    
    
    return dataArray;

}
/******* 数组变格式字符串  *******/
-(NSString *)GZMarrayToJson
{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *str = [NSMutableString stringWithString:jsonStr];
    
    NSRange range2 = {0,jsonStr.length};
    [str replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    NSRange range = {0,str.length};
    [str replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    return str;
}


@end
