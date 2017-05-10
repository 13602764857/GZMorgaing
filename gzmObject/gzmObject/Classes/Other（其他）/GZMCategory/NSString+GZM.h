//
//  NSString+GZM.h
//  AgentTool
//
//  Created by gzm on 17/3/13.
//  Copyright © 2017年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GZM)
/******* MD5 32位  *******/
-(NSString *)GZMmd532Digest;
/******* MD5 16位  *******/
-(NSString *)GZMmd516HexDigest;
/******* js字符串转字典  *******/
-(NSDictionary *)GZMdictionaryWithJsonString;

/******* 通过网址直接获取图片  *******/
//-(UIImage *)GZMImage;
@end
