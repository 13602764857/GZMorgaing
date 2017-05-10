//
//  RequestTool.h
//  company.meia
//
//  Created by meia-mac-002 on 15/11/23.
//  Copyright © 2015年 meia-mac-002. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <SystemConfiguration/SystemConfiguration.h>
//#import <MobileCoreServices/MobileCoreServices.h>
#import <AFNetworking.h>
typedef void (^requestBlock)(id message);


@interface RequestTool : NSObject

#pragma mark -- POST请求
+(void)sendPostAFRequest:(NSString *)url parameters:(NSDictionary *)parameters successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate loadWith:(loadIngtype)tpye;

//上传
+(void)uploadAFRequest:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSDictionary *)fileName successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate with:(loadIngtype)tpye;

#pragma mark -- GET请求是否加载菊花界面
+(void)sendGetAFRequest:(NSString *)url parameters:(NSDictionary *)parameters successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate loadWith:(loadIngtype)tpye;
/******* 上传图片且加载样式  *******/
+(void)uploadImageAFRequest:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSDictionary *)fileName successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate with:(loadIngtype)tpye;
@end
