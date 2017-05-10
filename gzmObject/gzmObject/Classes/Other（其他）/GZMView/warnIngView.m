//
//  warnIngView.m
//  GzAgent
//
//  Created by gzm on 16/4/18.
//  Copyright © 2016年 gzcentaline. All rights reserved.
//

#import "warnIngView.h"

@implementation warnIngView
{
    NSString * str1;
    UIViewController * vc1;
}
+(void)warnWithstring:(NSString *)str WithVc:(UIViewController *)vc{
    UIAlertController  * alert = [UIAlertController alertControllerWithTitle:@"" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * quxiao =[UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alert addAction:quxiao];
     dispatch_async(dispatch_get_main_queue(), ^{
         [vc presentViewController:alert animated:YES completion:nil];
     });
}

-(instancetype)initWithstring:(NSString *)str WithVc:(UIViewController *)vc{
    if (self = [super init]) {
        
        UIAlertController  * alert = [UIAlertController alertControllerWithTitle:@"" message:str preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * quxiao =[UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
               self.BackBlock();
           
            
        }];
        
        [alert addAction:quxiao];
        dispatch_async(dispatch_get_main_queue(), ^{
            [vc presentViewController:alert animated:YES completion:nil];
        });

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
