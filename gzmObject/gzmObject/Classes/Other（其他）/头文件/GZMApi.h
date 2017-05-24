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


#endif /* GZMApi_h */
