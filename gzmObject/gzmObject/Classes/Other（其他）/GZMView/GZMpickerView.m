//
//  GZMpickerView.m
//  gzmObject
//
//  Created by gzm on 2017/5/31.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import "GZMpickerView.h"

@implementation GZMpickerView
{
    NSArray * dataArr1;
    NSInteger component1;
    NSInteger row1 ;
}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock withType:(GZMPicketTpye)type{
    if (self = [super initWithFrame:frame]) {
        _datablock = dataBlock;
        dataArr1 = dataArr;
        _picketType = type;
        [self addSubview:self.myPickerView];
        
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock{
    if (self = [super initWithFrame:frame]) {
        _datablock = dataBlock;
        dataArr1 = dataArr;
        _picketType = PicketTypeTwo;
        [self addSubview:self.myPickerView];
        
    }return self;
}
-(void)creatButton{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 30)];
    view.backgroundColor = [UIColor GZMcolorWithHexString:@"#f5f5f5"];
    [view GZMchangeStyleWith:1 withborad:1 withBoardColor:[UIColor blackColor]];
    [self addSubview:view];
    
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, 80, 30)];
//    button1.backgroundColor = [UIColor GZMcolorWithHexString:@"#ededed"];
    [button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
//    [button1 GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    button1.tag = 101;
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"取消" forState:UIControlStateNormal];
//    button1.backgroundColor = MianColor;
    [view addSubview:button1];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(Width - 100, 0, 80, 30)];
//    button2.backgroundColor = [UIColor GZMcolorWithHexString:@"#ededed"];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
//    [button2 GZMchangeStyleWith:4 withborad:1 withBoardColor:[UIColor GZMcolorWithHexString:@"#199fff"]];
    [button2 setTitle:@"确定" forState:UIControlStateNormal];
    button2.tag = 102;
//    button2.backgroundColor = MianColor;
    [view addSubview:button2];
}
-(void)button1Click:(UIButton *)button{
    [self removeFromSuperview];
    switch (button.tag) {
        case 101:
        {
           
        }
            break;
        case 102:
        {
            if (component1 == 0) {
                self.datablock(@{@"component":[NSString stringWithFormat:@"%ld",(long)component1],@"row":dataArr1[row1]});
            }else{
                self.datablock(@{@"component":[NSString stringWithFormat:@"%ld",(long)component1],@"row":self.secondData[row1]});
            }

        }
            break;
            
        default:
            break;
    }
    
}
-(UIPickerView *)myPickerView{
    if (!_myPickerView) {
        self.backgroundColor = [UIColor whiteColor];
        _myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, self.width, self.height - 30)];
        _myPickerView.delegate = self;
        //        [self.myPickerView reloadAllComponents];
        _myPickerView.dataSource = self;
        _myPickerView.backgroundColor = [UIColor whiteColor];
        [_myPickerView selectRow:0 inComponent:0 animated:YES];
        [self pickerView:_myPickerView didSelectRow:0 inComponent:0];
        [self creatButton];
    }
    return _myPickerView;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return dataArr1[row];
    }else{
        return self.secondData[row];
    }
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return dataArr1.count;
    }else{
        return self.secondData.count;
    }
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%ld",(long)row);
    component1 = component;
    row1 = row;
    switch (_picketType) {
        case PicketTypeOne:
        {
            
        }
            break;
        case PicketTypeTwo:
        {
            if (component1 == 0) {
                self.datablock(@{@"component":[NSString stringWithFormat:@"%ld",(long)component1],@"row":dataArr1[row1]});
            }
        }
            break;
        case PicketTypeThree:
        {
            
        }
            break;
        default:
            break;
    }

}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    switch (_picketType) {
        case PicketTypeOne:
        {
            return 1;
        }
            break;
        case PicketTypeTwo:
        {
             return 2;
        }
            break;
        case PicketTypeThree:
        {
            return 3;
        }
            break;
        default:
            break;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
