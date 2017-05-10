//
//  NSString+GZM.m
//  AgentTool
//
//  Created by gzm on 17/3/13.
//  Copyright © 2017年 test. All rights reserved.
//

#import "NSString+GZM.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (GZM)
/******* MD5 16位  *******/
-(NSString *)GZMmd516HexDigest
{
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        
        [hash appendFormat:@"%02X", result[i]];
    }
    NSLog(@"%@",hash);
    //    [[hash substringWithRange:NSMakeRange(8, 16)] uppercaseString];
    return [[hash substringWithRange:NSMakeRange(8, 16)] lowercaseString];
}


/******* MD5 32位  *******/
-(NSString *)GZMmd532Digest
{
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        
        [hash appendFormat:@"%02X", result[i]];
    }
    
    return hash;
}
/******* js字符串转字典  *******/
-(NSDictionary *)GZMdictionaryWithJsonString {
    if (self == nil) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
/******* 通过网址直接获取图片  *******/
//-(UIImage *)GZMImage{
//    NSURL * imageUrl = [NSURL URLWithString:self];
//    NSData * data = [NSData dataWithContentsOfURL:imageUrl];
//    UIImage * image = [UIImage imageWithData:data];
//    return  image;
//}

@end
