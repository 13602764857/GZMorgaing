//
//  GZMProjectModel.h
//  gzmObject
//
//  Created by gzm on 2017/5/9.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZMProjectModel : NSObject

@property (nonatomic,copy) NSString *Remark;
@property (nonatomic,copy) NSString *CreateDate;
@property (nonatomic,copy) NSString *PlatformName;
@property (nonatomic,copy) NSString *ProjectID;
@property (nonatomic,copy) NSString *ProjectName;
@property (nonatomic,copy) NSString *AppID;
@property (nonatomic,copy) NSString *Count;
@property (nonatomic,copy) NSString *Versions;
@property (nonatomic,copy) NSString *Effective;
@property (nonatomic,copy) NSString *Image;
@property (nonatomic,copy) NSString *PlatformID;




+(NSMutableArray *)setModelWithArray:(NSArray *)array;
@end
