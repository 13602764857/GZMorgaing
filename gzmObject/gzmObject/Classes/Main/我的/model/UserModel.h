//
//  UserModel.h
//  gzmObject
//
//  Created by gzm on 2017/6/2.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,copy) NSString *NickName;
@property (nonatomic,copy) NSString *UserCount;
@property (nonatomic,copy) NSString *ProjectCount;
@property (nonatomic,copy) NSString *ULogo;
@property (nonatomic,copy) NSString *UserName;
@property (nonatomic,copy) NSString *UserID;
@property (nonatomic,copy) NSString *LoginHistory;
+(NSMutableArray *)setModelWithArray:(NSArray *)array;
@end
