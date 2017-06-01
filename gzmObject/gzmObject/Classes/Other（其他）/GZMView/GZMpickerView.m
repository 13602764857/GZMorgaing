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
}
-(instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)dataArr With:(DataBlock)dataBlock{
    if (self = [super initWithFrame:frame]) {
        _datablock = dataBlock;
        dataArr1 = dataArr;
        [self addSubview:self.myPickerView];
        
    }return self;
}
-(UIPickerView *)myPickerView{
    if (!_myPickerView) {
        _myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _myPickerView.delegate = self;
        //        [self.myPickerView reloadAllComponents];
        _myPickerView.dataSource = self;
        _myPickerView.backgroundColor = [UIColor whiteColor];
        [_myPickerView selectRow:0 inComponent:0 animated:YES];
        [self pickerView:_myPickerView didSelectRow:0 inComponent:0];
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
    if (component == 0) {
        self.datablock(@{@"component":[NSString stringWithFormat:@"%ld",(long)component],@"row":dataArr1[row]});
    }else{
        self.datablock(@{@"component":[NSString stringWithFormat:@"%ld",(long)component],@"row":self.secondData[row]});
    }
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
