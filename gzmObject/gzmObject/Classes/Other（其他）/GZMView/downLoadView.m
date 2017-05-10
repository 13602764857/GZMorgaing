//
//  downLoadView.m
//  AgentTool
//
//  Created by gzm on 17/3/22.
//  Copyright © 2017年 test. All rights reserved.
//

#import "downLoadView.h"
static downLoadView * BGFmdb;
static dispatch_once_t onceToken;
//#import "XLCircleProgress.h"
@implementation downLoadView
+(downLoadView *)shareDownView{
   
    if(BGFmdb == nil){
        
        dispatch_once(&onceToken, ^{
            BGFmdb = [[downLoadView alloc] init];
        });
    }
    return BGFmdb;

}

+(void)tearDown{
    BGFmdb = nil;
    onceToken = 0l;
}

-(instancetype)init{
    if ( self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
        self.frame = CGRectMake(0, 0, Width, Height);
        [self creatView];
    }return self;
}
//-(UAProgressView *)upProgressView{
//    if (!_upProgressView) {
//        _upProgressView = [[UAProgressView alloc] init];
//        _upProgressView.center = CGPointMake(Width/2, Height/2);
//        _upProgressView.bounds = CGRectMake(0, 0, 150, 150);
//        _upProgressView.tintColor = MianColor;
//        _upProgressView.lineWidth = 4;
//        _upProgressView.fillOnTouch = NO;
////        _upProgressView.backgroundColor = [UIColor redColor];
//        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60.0, 32.0)];
////        _textLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:32];
//        _textLabel.font = [UIFont systemFontOfSize:30];
//        _textLabel.text = @"0%";
//        _textLabel.textAlignment = NSTextAlignmentCenter;
//        _textLabel.textColor = _upProgressView.tintColor;
//        _textLabel.backgroundColor = [UIColor clearColor];
//        _upProgressView.centralView = _textLabel;
//        _upProgressView.progressChangedBlock = ^(UAProgressView *progressView, CGFloat progress){
//            [(UILabel *)progressView.centralView setText:[NSString stringWithFormat:@"%2.0f%%",  progress * 100]];
//            
//            
//        };
////        _upProgressView.progress = 0.5;
//    }return _upProgressView;
//}
-(void)creatView{
//    _circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
//    _circle.center = self.center;
//    [self addSubview:_circle];
    _waveProgress = [[XLWaveProgress alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _waveProgress.center = self.center;
    [self addSubview:_waveProgress];
    _waveProgress.progress = 0.0f;
//    [self addSubview:self.upProgressView];
//    UILabel * lable = [[UILabel alloc] init];
//    lable.frame = CGRectMake(CGRectGetMinX(_upProgressView.frame), CGRectGetMaxY(_upProgressView.frame) + 5, _upProgressView.width, 20) ;
//    lable.text = @"请耐心等待上传...";
//    lable.textColor = MianColor;
//    lable.font = [UIFont systemFontOfSize:17];
//    lable.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:lable];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
