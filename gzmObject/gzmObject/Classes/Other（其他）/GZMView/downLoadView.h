//
//  downLoadView.h
//  AgentTool
//
//  Created by gzm on 17/3/22.
//  Copyright © 2017年 test. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "XLWaveProgress.h"

@interface downLoadView : UIView
+(downLoadView *)shareDownView;
+(void)tearDown;
/******* <#name#>  *******/
@property(nonatomic,assign)double netePrograss;

/******* <#name#>  *******/
@property(nonatomic,strong) UILabel *textLabel;

/******* <#name#>  *******/
@property(nonatomic,strong) XLWaveProgress *waveProgress;
@end
