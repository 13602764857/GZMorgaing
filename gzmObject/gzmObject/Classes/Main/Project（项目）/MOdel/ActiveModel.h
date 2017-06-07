//
//  ActiveModel.h
//  gzmObject
//
//  Created by gzm on 2017/5/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActiveModel : NSObject
@property (nonatomic,copy) NSString *CreateDate;
@property (nonatomic,copy) NSString *ProjectName;
@property (nonatomic,copy) NSString *AuthID;
@property (nonatomic,copy) NSString *AuthTime;
@property (nonatomic,copy) NSString *PlatformName;
@property (nonatomic,copy) NSString *UniqueID;
@property (nonatomic,copy) NSString *Code;
@property (nonatomic,copy) NSString *Effective;
@property (nonatomic,copy) NSString *IsExtract;
+(NSMutableArray *)setModelWithArray:(NSArray *)array;
@end
