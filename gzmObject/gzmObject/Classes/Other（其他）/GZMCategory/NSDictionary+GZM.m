//
//  NSDictionary+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/13.
//  Copyright © 2017年 test. All rights reserved.
//

#import "NSDictionary+GZM.h"

@implementation NSDictionary (GZM)
/******* dic变格式字符串  *******/
- (NSString*)GZMdictionaryToJson

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
