//
//  NetWorkUtil.h
//  YlbOc
//
//  Created by ylb on 2018/2/28.
//  Copyright © 2018年 YLB. All rights reserved.
//


#import "QYAFNetWork.h"
#import "ResponseModel.h"

#ifndef NetWorkUtil_h
#define NetWorkUtil_h



#ifdef DEBUG

#define   MainHost               @"https://www.true/api"

#else

#define   MainHost               @"https://www.test/api"

#endif



/******* test *******/
#define TestUrl    [MainHost stringByAppendingString:@"/test"] //test










#endif /* NetWorkUtil_h */
