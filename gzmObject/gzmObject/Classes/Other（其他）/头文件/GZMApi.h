//
//  GZMApi.h
//  gzmObject
//
//  Created by gzm on 2017/4/26.
//  Copyright © 2017年 gzm. All rights reserved.
//

#ifndef GZMApi_h
#define GZMApi_h
#import "RequestTool.h"
#define BaseUrl @"http://192.168.0.160:8080/"
/********** 登陆************/
#define ModifyNickName          @"api/Account/ModifyNickName"
#define UserLogin                   @"Author/UserLogin"
#define Register                   @"api/Account/Register"

/********** 项目************/
#define GetProjectList          @"api/Project/GetProjectList"
#define ProjectDetails          @"api/Project/ProjectDetails"
#define GetLanguageList          @"api/Project/GetLanguageList"
#define GetPlatformList          @"api/Project/GetPlatformList"
#define DeleteProject          @"api/Project/DeleteProject"
#define ModifyProject          @"api/Project/ModifyProject"
#define CreateProject          @"api/Project/CreateProject"


/********** 问题列表************/
#define QuestionList          @"api/Account/QuestionList"

/********** 激活码************/
#define GetAuthCodeList          @"api/AuthCode/GetAuthCodeList"
#define GetAuthCodeGroup          @"api/AuthCode/GetAuthCodeGroup"
#define GenAuthCode          @"api/AuthCode/GenAuthCode"
#define DiscardCode          @"api/AuthCode/DiscardCode"
#define ExtractCodeBatch          @"api/AuthCode/ExtractCodeBatch"
#define ExtractCode          @"api/AuthCode/ExtractCode"
#define ExtractHistory          @"api/AuthCode/ExtractHistory"
#define ReExtractCode          @"api/AuthCode/ReExtractCode"


/********** 登陆注册************/
#define GetSafetyQuestion          @"api/Account/GetSafetyQuestion"
#define VerifySafetyQuestion          @"api/Account/VerifySafetyQuestion"
#define ModifySafety          @"api/Account/ModifySafety"
#define ModifyUserPass          @"api/Account/ModifyUserPass"
#define ModifyNickName          @"api/Account/ModifyNickName"
#define GetQuestionByUserName          @"api/Account/GetQuestionByUserName"
#define GetAuthorInfo          @"api/Account/GetAuthorInfo"
#define Exit          @"api/Account/Exit"
#define ExtractCodeBatch          @"api/AuthCode/ExtractCodeBatch"
#define VerifySafetyQuestion2          @"api/Account/VerifySafetyQuestion2"
#define ResetPass          @"api/Account/ResetPass"

/********** 获取设备列表************/
#define GetDeviceList          @"api/Device/GetDeviceList"
#define GenAPICode          @"api/Project/GenAPICode"
#define ModifyRemark          @"api/Device/ModifyRemark"
#define DeviceDetails          @"api/Device/DeviceDetails"


#endif /* GZMApi_h */
