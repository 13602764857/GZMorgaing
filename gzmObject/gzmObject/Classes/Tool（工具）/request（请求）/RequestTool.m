//
//  RequestTool.m
//  company.meia
//
//  Created by meia-mac-002 on 15/11/23.
//  Copyright © 2015年 meia-mac-002. All rights reserved.
//

#import "RequestTool.h"
#import "AppDelegate.h"
#import "downLoadView.h"
#import "GZMLoginViewController.h"
@implementation RequestTool

+(AFHTTPSessionManager *)initManager{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    manager.requestSerializer.timeoutInterval = 30;
    return manager;
}
+(void)sendPostAFRequest:(NSString *)url parameters:(NSDictionary *)parameters successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate loadWith:(loadIngtype)tpye{
//    LoadIngView * loading = [[LoadIngView alloc] initWithFrame:CGRectMake(0, 0, delegate.view.width, delegate.view.height)];
//    
//    if (delegate.view.height == Height) {
//        loading.y = 64;
//    }
//    if (tpye == mainLoading) {
//        [delegate.view addSubview:loading];
//    }
    
    AFHTTPSessionManager * manager = [self initManager];
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [loading removeFromSuperview];
        NSLog(@"%@",responseObject);
        [self success:successBlock dicResponseObject:responseObject delegate:delegate];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [loading removeFromSuperview];
        [self fail:failBlock error:error delegate:delegate];
        
    }];
    
}

/******* get请求  *******/
+(void)sendGetAFRequest:(NSString *)url parameters:(NSDictionary *)parameters successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate loadWith:(loadIngtype)tpye{
    AFHTTPSessionManager * manager = [self initManager];
//    LoadIngView * loading = [[LoadIngView alloc] initWithFrame:CGRectMake(0, 0, delegate.view.width, delegate.view.height)];
//    if (delegate) {
//        if (delegate.view.height == Height) {
//            loading.y = 64;
//        }
//    }
    
//    if (tpye == mainLoading) {
//        [delegate.view addSubview:loading];
//    }
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [loading removeFromSuperview];
        [self success:successBlock dicResponseObject:responseObject delegate:delegate];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [loading removeFromSuperview];
        
        [self fail:failBlock error:error delegate:delegate];
    }];
    
}

+(void)uploadAFRequest:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSDictionary *)fileName successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate with:(loadIngtype)tpye{
    AFHTTPSessionManager * manager = [self initManager];
    NSLog(@"%@",data);
    /******* 进度条  *******/
    downLoadView * down = [downLoadView shareDownView];
//    __weak downLoadView * WeekDown = down;
    NSLog(@"%@%@",fileName[@"index"],fileName[@"all"]);
    
    NSLog(@"%f",down.netePrograss);
    /******* 菊花转动  *******/
    LoadIngView * loading = [[LoadIngView alloc] initWithFrame:CGRectMake(0, 0, delegate.view.width, delegate.view.height)];
    if (delegate) {
        if (delegate.view.height == Height) {
            loading.y = 64;
        }
    }
    
    if (tpye == mainLoading) {
        [delegate.view addSubview:loading];
    }else{
        if ([fileName[@"index"] isEqualToString:@"0"]) {
            [delegate.view addSubview:down];
        }
        
    }
    
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:parameters[@"data"] name:@"mp3" fileName:@"" mimeType:@"video/mp4"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f",uploadProgress.fractionCompleted);
        if (tpye != mainLoading) {
            down.netePrograss = ([fileName[@"index"]floatValue])/([fileName[@"all"]integerValue] +1) + uploadProgress.fractionCompleted/([fileName[@"all"]integerValue] +1);
            
            NSLog(@"%f",uploadProgress.fractionCompleted/[fileName[@"all"]floatValue]);
            
            down.waveProgress.progress = down.netePrograss;
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (tpye != mainLoading) {
            if ([fileName[@"index"] isEqualToString:fileName[@"all"]]) {
                [down removeFromSuperview];
                down.netePrograss = 0.01;
                //销毁单利
                [downLoadView tearDown];
                
            }
        }else{
            [loading removeFromSuperview];
        }
        
        
        [self success:successBlock dicResponseObject:responseObject delegate:delegate];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (tpye != mainLoading) {
            [down removeFromSuperview];
            down.netePrograss = 0.01;
            [downLoadView tearDown];
        }else{
            [loading removeFromSuperview];
        }
        
        
        
        [self fail:failBlock error:error delegate:delegate];
    }];
    
}

+(void)success:(requestBlock)successBlock dicResponseObject:(id)responseObject delegate:(UIViewController *)delegate{
    if(successBlock){
        if ([responseObject[@"issuccess"] isEqualToNumber:@1]) {
            successBlock(responseObject);
        }else{
            if ([responseObject[@"issuccess"] isEqualToNumber:@2]) {
                successBlock(nil);
                [UserDefaults removeObjectForKey:@"toketen"];
                
                GZMLoginViewController * loginVc = [[GZMLoginViewController alloc] init];
                [delegate presentViewController:loginVc animated:YES completion:nil];
            }else{
                NSLog(@"%@",responseObject);
                downLoadView * down = [downLoadView shareDownView];
                down.netePrograss = 0.01;
                [downLoadView tearDown];
                [down removeFromSuperview];
//                [AlerYangShi showMessage:responseObject[@"message"] duration:0.5];
//                [warnIngView warnWithstring:responseObject[@"message"] WithVc:delegate];
                 successBlock(responseObject);
            }
            
        }
    }
}

+(void)fail:(requestBlock)failBlock error:(NSError *)error delegate:(UIViewController *)delegate{
    
    NSLog(@"%ld",(long)[error code]);
    NSLog(@"%@",error );
    if(failBlock){
        AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if(app.reach == AFNetworkReachabilityStatusNotReachable){
            [AlerYangShi creatTitleWith:@"网络连接中断，请设置网络连接" creatOneWith:@"取消" withTwoStr:@"设置" WithVc:delegate withSuccessBlock:^{
                failBlock(error);
                if (IOS_VERSION_10_OR_ABOVE) {
                    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }

            } withErrorBlock:^{
                failBlock(error);
            }];
            
        }else{
            if([error code] == -1001){
//                [warnIngView warnWithstring:@"请求超时" WithVc:delegate];
                [AlerYangShi creatTitleWith:@"请求超时" creatOnlyStrWith:nil WithVc:delegate withBlock:^{
                    failBlock(error);
                }];
            }else{
                [AlerYangShi creatTitleWith:[NSString stringWithFormat:@"请求失败，错误码：%ld",(long)[error code]] creatOnlyStrWith:nil WithVc:delegate withBlock:^{
                    failBlock([NSString stringWithFormat:@"请求失败，错误码：%ld",(long)[error code]]);
                }];

            }
        }
    }
}

+(void)uploadImageAFRequest:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSDictionary *)fileName successBlock:(requestBlock)successBlock failBlock:(requestBlock)failBlock delegate:(UIViewController *)delegate with:(loadIngtype)tpye{
    
    AFHTTPSessionManager * manager = [self initManager];
    NSLog(@"%@",data);
    /******* 进度条  *******/
    downLoadView * down = [downLoadView shareDownView];
    NSLog(@"%@%@",fileName[@"index"],fileName[@"all"]);
    
    NSLog(@"%f",down.netePrograss);
    /******* 菊花转动  *******/
    LoadIngView * loading = [[LoadIngView alloc] initWithFrame:CGRectMake(0, 0, delegate.view.width, delegate.view.height)];
    if (delegate) {
        if (delegate.view.height == Height) {
            loading.y = 64;
        }
    }
    
    if (tpye == mainLoading) {
        [delegate.view addSubview:loading];
    }else{
        if ([fileName[@"index"] isEqualToString:@"0"]) {
            [delegate.view addSubview:down];
        }
        
    }
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (data!=nil) {   // 图片数据不为空才传递
            [formData appendPartWithFileData:data name:@"picture" fileName:@"" mimeType:@"image/png"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (tpye != mainLoading) {
            down.netePrograss = ([fileName[@"index"]floatValue])/([fileName[@"all"]integerValue] +1) + uploadProgress.fractionCompleted/([fileName[@"all"]integerValue] +1);
            
            NSLog(@"%f",uploadProgress.fractionCompleted/[fileName[@"all"]floatValue]);
            
            down.waveProgress.progress = down.netePrograss;
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (tpye != mainLoading) {
            if ([fileName[@"index"] isEqualToString:fileName[@"all"]]) {
                down.netePrograss = 0.01;
                [down removeFromSuperview];
                //销毁单利
                [downLoadView tearDown];
                
            }
        }else{
            [loading removeFromSuperview];
        }
        
        [self success:successBlock dicResponseObject:responseObject delegate:delegate];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (tpye != mainLoading) {
            down.netePrograss = 0.01;
            [down removeFromSuperview];
            [downLoadView tearDown];
            
        }else{
            [loading removeFromSuperview];
        }
        
        [self fail:failBlock error:error delegate:delegate];
    }];
    
}


@end
