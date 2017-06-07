//
//  GZMEqupmenttionMOdel.h
//  gzmObject
//
//  Created by gzm on 2017/6/5.
//  Copyright © 2017年 gzm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZMEqupmenttionMOdel : NSObject
@property (nonatomic,copy) NSString *LastDate;
@property (nonatomic,copy) NSString *LastIP;
@property (nonatomic,copy) NSNumber *Request;
@property (nonatomic,copy) NSString *Remark;
@property (nonatomic,copy) NSString *UDID;
@property (nonatomic,copy) NSString *ProjectName;
@property (nonatomic,copy) NSString *ExpireDate;
@property (nonatomic,copy) NSString *CreateDate;
@property (nonatomic,copy) NSString *Model;
@property (nonatomic,copy) NSString *Resolution;
@property (nonatomic,copy) NSNumber *DeviceID;
+(NSMutableArray *)setModelWithArray:(NSArray *)array;
@end
