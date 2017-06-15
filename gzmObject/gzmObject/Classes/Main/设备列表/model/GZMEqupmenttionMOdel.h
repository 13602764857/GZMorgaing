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
@property (nonatomic,copy) NSString *Request;
@property (nonatomic,copy) NSString *Remark;
@property (nonatomic,copy) NSString *UDID;
@property (nonatomic,copy) NSString *ProjectName;
@property (nonatomic,copy) NSString *ExpireDate;
@property (nonatomic,copy) NSString *CreateDate;
@property (nonatomic,copy) NSString *Model;
@property (nonatomic,copy) NSString *Resolution;
@property (nonatomic,copy) NSString *DeviceID;
@property (nonatomic,copy) NSString *Effective;



@property (nonatomic,copy) NSString *Codes;


@property (nonatomic,strong) NSArray *Locations;


@property (nonatomic,copy) NSString *LastLocation;

+(NSMutableArray *)setModelWithArray:(NSArray *)array;
@end
