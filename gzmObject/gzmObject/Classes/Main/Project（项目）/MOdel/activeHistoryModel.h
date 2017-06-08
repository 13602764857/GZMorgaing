//
//  activeHistoryModel.h
//  gzmObject
//
//  Created by gzm on 2017/6/7.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface activeHistoryModel : NSObject
@property (nonatomic,copy) NSString *ExtractTime;
@property (nonatomic,copy) NSString *File;
@property (nonatomic,copy) NSString *ExtractID;
@property (nonatomic,copy) NSString *Num;
+(NSMutableArray *)setModelWithArray:(NSArray *)array;
@end
