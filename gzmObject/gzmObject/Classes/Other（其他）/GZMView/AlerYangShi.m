//
//  AlerYangShi.m
//  GzAgent
//
//  Created by gongzhiming on 16/6/5.
//  Copyright © 2016年 gzcentaline. All rights reserved.
//

#import "AlerYangShi.h"

@implementation AlerYangShi
static UITextField * MytextFile;


+(void)creatStr1With:(NSString *)title creatStr2With:(NSString *)str2 WithVc:(UIViewController *)vc withBlock:(void(^)(id))block{

    NSString *mainTitle = title;
    UIAlertController *AlertVc = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];

    NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:mainTitle];
    [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, mainTitle.length)];
    [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor GZMcolorWithRed:51 green:51 blue:51] range:NSMakeRange(0, mainTitle.length)];
    [AlertVc setValue:titleText forKey:@"attributedTitle"];
        
    UIAlertAction *queding = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block(@"");
    }];
    [queding setValue:[UIColor GZMcolorWithRed:255 green:144 blue:1] forKey:@"titleTextColor"];
    UIAlertAction *quXiao = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    [quXiao setValue:[UIColor GZMcolorWithRed:0 green:132 blue:255] forKey:@"titleTextColor"];
    
     [AlertVc addAction:quXiao];
    [AlertVc addAction:queding];
   

    [vc presentViewController:AlertVc animated:YES completion:nil];

}
/******* 确定和返回的双重提示  *******/
+(void)creatTitleWith:(NSString *)title creatOneWith:(NSString *)oneStr withTwoStr:(NSString *)TwoStr WithVc:(UIViewController *)vc withSuccessBlock:(void (^)(void))Successblock withErrorBlock:(void (^)(void))Errorblock{
    NSString *mainTitle = title;
   
    UIAlertController *AlertVc = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:mainTitle];
    [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, mainTitle.length)];
    [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor GZMcolorWithRed:51 green:51 blue:51] range:NSMakeRange(0, mainTitle.length)];
    [AlertVc setValue:titleText forKey:@"attributedTitle"];
    NSString * str1 = @"取消";
    NSString * str2 = @"确定";
    if (oneStr.length != 0) {
        str1 = oneStr;
    }
    if (TwoStr.length != 0) {
        str2 = TwoStr;
    }
    UIAlertAction *queding = [UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        Successblock();
    }];
    [queding setValue:[UIColor GZMcolorWithRed:255 green:144 blue:1] forKey:@"titleTextColor"];
    UIAlertAction *quXiao = [UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        Errorblock();

    }];
    [quXiao setValue:[UIColor GZMcolorWithRed:0 green:132 blue:255] forKey:@"titleTextColor"];
    
    [AlertVc addAction:quXiao];
    [AlertVc addAction:queding];
    
    
    [vc presentViewController:AlertVc animated:YES completion:nil];
}
/******* (有textfiled)确定和返回的双重提示  *******/
+(void)creatTitleWithAndTexifiled:(NSString *)title creatOneWith:(NSString *)oneStr withTwoStr:(NSString *)TwoStr WithVc:(UIViewController *)vc withSuccessBlock:(void (^)(id str))Successblock withErrorBlock:(void (^)(void))Errorblock{
    NSString *mainTitle = title;
    
    UIAlertController *AlertVc = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:mainTitle];
    [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, mainTitle.length)];
    [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor GZMcolorWithRed:51 green:51 blue:51] range:NSMakeRange(0, mainTitle.length)];
    [AlertVc setValue:titleText forKey:@"attributedTitle"];
    NSString * str1 = @"取消";
    NSString * str2 = @"确定";
    if (oneStr.length != 0) {
        str1 = oneStr;
    }
    if (TwoStr.length != 0) {
        str2 = TwoStr;
    }
    [AlertVc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        MytextFile = textField;
        
    }];
    UIAlertAction *queding = [UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        Successblock(MytextFile.text);
     
    }];
    [queding setValue:[UIColor GZMcolorWithRed:255 green:144 blue:1] forKey:@"titleTextColor"];
    UIAlertAction *quXiao = [UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        Errorblock();
        
    }];
    [quXiao setValue:[UIColor GZMcolorWithRed:0 green:132 blue:255] forKey:@"titleTextColor"];
    
    [AlertVc addAction:quXiao];
    [AlertVc addAction:queding];
    
    
    [vc presentViewController:AlertVc animated:YES completion:nil];
}

//-(void)usernameDidChange{
////    textFiledStr = textFiled.text;
//}

/******* 单纯的提示框不做任何操作  *******/
+(void)tishiWithMessage:(NSString *)messageStr WithVc:(UIViewController *)vc{
    UIAlertController * uiAlert = [UIAlertController alertControllerWithTitle:messageStr message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * quxiao =[UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [uiAlert addAction:quxiao];
    [vc presentViewController:uiAlert animated:YES completion:nil];
    
}

/******* 单纯的提示框但是会有回调看自己要不要操作  *******/
+(void)creatTitleWith:(NSString *)title creatOnlyStrWith:(NSString *)onlyStr WithVc:(UIViewController *)vc withBlock:(void(^)(void))block{
    UIAlertController * uiAlert = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleAlert];
    NSString * str1 = @"返回";
    if (onlyStr.length != 0) {
        str1 = onlyStr;
    }
    UIAlertAction * quxiao =[UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        block();
    }];
    [uiAlert addAction:quxiao];
    [vc presentViewController:uiAlert animated:YES completion:nil];
}
#pragma mark - 一、显示定制View的消息，定时消失

//==============================================================================


+(void)showMessage:(NSString *)message duration:(NSTimeInterval)time
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor grayColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15.f],
                                 NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [message boundingRectWithSize:CGSizeMake(207, 999)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attributes context:nil].size;
    
    label.frame = CGRectMake(10, 5, labelSize.width +20, labelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    label.numberOfLines = 0;
    [showview addSubview:label];
    
    showview.frame = CGRectMake((screenSize.width - labelSize.width - 20)/2,
                                screenSize.height - 100,
                                labelSize.width+40,
                                labelSize.height+10);
    [UIView animateWithDuration:time animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}
@end
