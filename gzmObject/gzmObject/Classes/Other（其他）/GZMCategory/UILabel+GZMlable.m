//
//  UILabel+GZMlable.m
//  AgentTool
//
//  Created by gzm on 17/2/23.
//  Copyright © 2017年 test. All rights reserved.
//

#import "UILabel+GZMlable.h"

@implementation UILabel (GZMlable)

- (void)textLeftTopAlignWithSize:(CGFloat)size
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:size], NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [self.text boundingRectWithSize:CGSizeMake(207, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGRect dateFrame =CGRectMake(2, 140, CGRectGetWidth(self.frame)-5, labelSize.height);
    self.frame = dateFrame;
}
@end
